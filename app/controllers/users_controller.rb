class UsersController < ApplicationController
  before_action :check_admin, except: [:show, :update]
  before_action :authenticate_user!

  include Pagy::Backend

  def index
    @users = User.all
    @pagy, @users = pagy(@users)
  end

  def show
    @user = current_user
    @credit_card = @user.credit_card
  end

end
