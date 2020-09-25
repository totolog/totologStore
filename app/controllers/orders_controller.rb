class OrdersController < ApplicationController
    before_action :logged_in_user
    before_action :exist?, only: [:create]
    def index
        cart = Cart.find_by(user_id: current_user.id)
        @cart_items = CartItem.where(cart_id: cart.id)
        @product= Product.find_by(id: current_user.id)

        @address = Address.new
        @address.orders.build
        # order = @address.orders.build
        # order.order_products.build

    end

    def exist?
        cart = Cart.find_by(user_id: current_user.id)
        cart_items = CartItem.where(cart_id: cart.id)
        count = false
        messages = []
        product_quantities = []
        cart_items.each do |cart_item|
            product = Product.find(cart_item.product_id)
            if cart_item.quantity > product.count
                count = true
                messages << product.name
                product_quantities << product.count
            end
        end
        if count
            flash[:danger] = ""
            messages.zip(product_quantities) do |message, product_quantity|
                flash[:danger] << "#{message}の在庫が足りません、残り#{product_quantity}個です。<br>"
            end
            redirect_to cart_item_path(current_user)
        end
    end

    def create
        @address = Address.new(address_params)
        cart = Cart.find_by(user_id: current_user.id)
        cart_items = CartItem.where(cart_id: cart.id)
            if @address.save
                flash[:success] = "購入が完了しました。"
                cart_items.each do |cart_item|
                    product = Product.find(cart_item.product_id)
                    product_count = product.count - cart_item.quantity
                    product.update(count: product_count)
                end
                session.delete(:store)
                session.delete(:last_name)
                session.delete(:first_name)
                session.delete(:furi_last_name)
                session.delete(:furi_first_name)
                session.delete(:postal_code)
                session.delete(:prefecture)
                session.delete(:address)
                session.delete(:how_to_pay)
                CartItem.where(cart_id: current_cart).delete_all
                redirect_to root_path
            else
                render "index"
            end
    end

    private

    def address_params
        params.require(:address).permit(:user_id, :last_name, :first_name, :furi_last_name, :furi_first_name, :postal_code, :prefecture, :address, :store, :how_to_pay, orders_attributes:
            [
            :user_id, :product_id, :quantity
            ]
        )
    end
end
