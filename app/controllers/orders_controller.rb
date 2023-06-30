class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :check_admin, except: [:show, :create, :index]

  include Pagy::Backend

  # GET /orders or /orders.json
  def index
    @orders = Order.includes(:product, :user).all
    @orders = Order.where(status: params[:status]) if params[:status].present?
    @orders = Order.where(user_id: params[:user_id]) if params[:user_id].present?
    unless current_user.admin?
      @orders = @orders.where(user_id: current_user.id)
    end
    @pagy, @orders = pagy(@orders)
  end

  # GET /orders/1 or /orders/1.json
  def show
    unless current_user.admin?
      if(@order.user_id==current_user.id)
        render :show
      else
        redirect_to orders_url
      end
    end
  end

  # GET /orders/new
  #def new
  #  @order = Order.new
  #end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        product = @order.product
        product.update(stock: product.stock - 1)
        OrderMailer.send_email(current_user, @order).deliver_now
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if order_params[:tracking_nr].present? && @order.update(tracking_nr: order_params[:tracking_nr], status: :shipped)
        format.html { redirect_to order_url(@order), notice: "Order was successfully shipped." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:id, :user_id, :product_id, :status, :tracking_nr, :quantity)
    end
end
