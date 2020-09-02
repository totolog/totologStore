class ProductsController < ApplicationController
    before_action :logged_in_user, only: [:resister, :create]

    def index
        @product_count = Product.count
        @products = Product.paginate(page: params[:page], per_page: 9)
    end

    def show
    end

    def resister
        @product_resister = Product.new
    end
    
    def create
        @product_resister = Product.new(product_image_params)
        if @product_resister.save
            redirect_to products_path
        else
            render "resister"
        end
    end

    private
    def product_image_params
        params.require(:product).permit(:name, :price, :comment, :type, :image_name)
    end
end
