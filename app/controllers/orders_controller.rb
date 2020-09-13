class OrdersController < ApplicationController
    before_action :logged_in_user
    def index
        cart = Cart.find_by(user_id: current_user.id)
        @cart_items = CartItem.where(cart_id: cart.id)
        @product= Product.find_by(id: current_user.id)

        @address = Address.new
        @order = @address.orders.build

    end

    def create
        @address = Address.new(address_params)
        if @address.save
            flash[:success] = "購入が完了しました。"
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
        params.require(:address).permit(:user_id, :last_name, :first_name, :furi_last_name, :furi_first_name, :postal_code, :prefecture, :address, :store, :how_to_pay, orders_attributes: [
            product_id:[], quantity:[]
        ])
    end
end
