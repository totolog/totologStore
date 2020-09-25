class CartItemsController < ApplicationController
    before_action :logged_in_user
    before_action :current_cart, only: [:show, :set_line_item, :set_cart]
    before_action :set_line_item, only: [:create, :destroy]
    before_action :set_cart, only: [:create]

    def blank?
        cart_item = CartItem.find_by(product_id: params[:cart_item][:product_id])
        if cart_item.nil?
            return true
        else
            return false
        end
    end

    def create
        # @cart_item = @cart.cart_items.build(product_id: params[:cart_item][:product_id], quantity: params[:cart_item][:quantity])
        cart_item = CartItem.find_by(product_id: params[:cart_item][:product_id])

        if blank?
            @cart_item = @cart.cart_items.build(cart_item_params)
            if @cart_item.save
                flash[:success] = "Complete to enter the products you chose."
            else
                redirect_to products_path
            end
            redirect_to cart_item_path(current_user)
        else
            # flash[:success] = "Complete to add the count of product you chose."
            # cart_item_count = cart_item.quantity + params[:cart_item][:quantity].to_i
            # cart_item.update(quantity: cart_item_count)
            flash[:danger] = "You can't add this product before you added.If you change the count, please change in Cart page."
            redirect_to products_path
        end
    end

    def show
        cart = Cart.find_by(user_id: current_user.id)
        @cart_items = CartItem.where(cart_id: cart.id)

        # @product= Product.find(params[:id])
        # product_count = @product.count
        # @count = Array.new
        # @count.push *1..product_count
    end
    
    def update
        @cart_count = CartItem.find(params[:id])
        if @cart_count.update_attributes(count_params)
            flash[:success] = "数量の変更を完了しました。"
            redirect_to cart_item_path(current_user.id)
        else
            flash[:danger] = "数量の変更に失敗しました。"
            redirect_to cart_item_path
        end


    end

    def destroy
        CartItem.find(params[:cart_item_id]).destroy
        redirect_to cart_item_path(current_user)
    end

    private

    def set_line_item
        @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
    end

    def set_cart
        @cart = current_cart
    end

    def cart_item_params
        params.require(:cart_item).permit(:product_id, :quantity)
    end

    def count_params
        params.require(:cart_item).permit(:quantity)
    end
end
