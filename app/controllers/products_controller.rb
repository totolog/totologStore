class ProductsController < ApplicationController
    before_action :logged_in_user, only: [:resister, :create, :edit, :update]
    before_action :admin_user, only: [:resister, :create, :edit, :update]

    def index
        if params[:category] then
            category = Product.where(category: params[:category])
            category_order = category.order(created_at: :desc)
            @product_count = category.count
            @products = category_order.paginate(page: params[:page], per_page: 9)
        elsif params[:search]
            search = Product.search(params[:search])
            search_order = search.order(created_at: :desc)
            @product_count = search.count
            @products = search_order.paginate(page: params[:page], per_page: 9)
        else
            @product_count = Product.count
            @product_content = Product.order(created_at: :desc).all
            @products = @product_content.paginate(page: params[:page], per_page: 9)
        end
    end

    def search
        @products = Product.search(params:[:search])
    end

    def show
        @product= Product.find_by(id: params[:id])
        @product_images = @product.images
        @product_count = @product.count
        @count = Array.new
        @count.push *1..@product_count
    end

    def resister
        @product_resister = Product.new
        @image = @product_resister.images.build
        # @size = @product_resister.sizes.build
    end

    def create
        @product_resister = Product.new(product_image_params)
        if @product_resister.save
            flash[:success] = "商品の登録が完了しました。"
            redirect_to products_path
        else
            render "resister"
        end
    end

    def edit
        @product_resister = Product.find(params[:id])
    end

    def update
        @product_resister = Product.find(params[:id])
        if @product_resister.update_attributes(product_image_params)
            redirect_to products_path
        else
            render "edit"
        end
    end

    private
    def product_image_params
        params.require(:product).permit(:name, :price, :comment, :category, :count, images_attributes:
            [
                :id, :name1, :name2, :name3, :name4
            ]
            # , sizes_attributes:
            # [
            #     :id, :size, :count
            # ]
        )
    end
end
