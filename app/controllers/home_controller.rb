class HomeController < ApplicationController
    def home
        @products = Product.all.with_attached_image.order(:name)

        if params[:search].present?
            search_query = "%#{params[:search]}%"
            @products = @products.where("name LIKE ? OR description LIKE ?", search_query, search_query)
          end
    end
end