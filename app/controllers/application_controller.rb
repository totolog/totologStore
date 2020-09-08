class ApplicationController < ActionController::Base
    include SessionsHelper

    
    def current_cart
      if session[:cart_id]
        current_cart = Cart.find_by(id: session[:cart_id])
        session[:cart_id] = current_cart.id
        current_cart
      else
        current_cart = Cart.create(user_id: current_user.id)
        session[:cart_id] = current_cart.id
        current_cart = Cart.find_by(id: session[:cart_id])
        current_cart
      end
    end

    private
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end
    
    def admin_user
      unless current_user.admin?
        flash[:danger] = "You don't manager"
        redirect_to root_url
      end
    end

end
