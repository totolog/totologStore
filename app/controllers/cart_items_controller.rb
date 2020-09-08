class CartItemsController < ApplicationController

    before_action :set_line_item, only: [:create, :destroy]
    before_action :set_user
    before_action :set_cart

    def create
        @cart_item = @cart.cart_items.build(product_id: params[:cart_item][:product_id], quantity: params[:cart_item][:quantity])
        if @cart_item.save
            flash[:success] = "Complete to enter the products you chose."
            redirect_to cart_item_path(current_user)
        else
            redirect_to products_path
        end
    end

    def show
        cart = Cart.find_by(user_id: params[:id])
        @cart_items = CartItem.where(cart_id: cart.id)

        @product= Product.find_by(id: params[:id])
    end

    def destroy
        CartItem.find(params[:cart_item_id]).destroy
        redirect_to cart_item_path(current_user)
    end

    private

    def set_user
        @user = current_user
    end

    def set_line_item
        @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
    end

    def set_cart
        @cart = current_cart
    end
end
