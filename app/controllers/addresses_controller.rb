class AddressesController < ApplicationController
    before_action :logged_in_user
    before_action :no_cart, only: [:index]

    def index
        cart = Cart.find_by(user_id: current_user.id)
        @cart_items = CartItem.where(cart_id: cart.id)
        @product= Product.find_by(id: current_user.id)

        @addresses = Address.new
        @current_user = current_user
    end

    def create
        session[:store] = params[:session][:store]
        session[:last_name] = params[:session][:last_name]
        session[:first_name] = params[:session][:first_name]
        session[:furi_last_name] = params[:session][:furi_last_name]
        session[:furi_first_name] = params[:session][:furi_first_name]
        session[:postal_code] = params[:session][:postal_code]
        session[:prefecture] = params[:session][:prefecture]
        session[:address] = params[:session][:address]
        session[:how_to_pay] = params[:session][:how_to_pay]
        redirect_to orders_path
    end

    private

    def no_cart
        cart = Cart.find_by(user_id: current_user.id)
        cart_items = CartItem.find_by(cart_id: cart.id)
        if cart_items.nil?
            flash[:danger] = 'There is not a product in your cart'
            redirect_to products_path
        end

    end

end