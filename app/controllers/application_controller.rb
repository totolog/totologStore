class ApplicationController < ActionController::Base
    include SessionsHelper


    def current_cart
      cart = Cart.find_by(user_id: current_user.id)
      if cart
          current_cart = cart
      else
          current_cart = Cart.create(user_id: current_user.id)
      end
      current_cart
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
