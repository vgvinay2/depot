class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include SessionsHelper
  # if you remove the # then it will not go users/new

  # before_filter :authorize
Test Line by Vgvinay @@@@@@@@@@@@@@222222
  protect_from_forgery with: :exception
  private
    def current_cart
      Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
  
      cart
    end


  protected

    def authorize
        unless session[:user_id] && User.find_by_id(session[:user_id])
          redirect_to login_path, :notice => "Please log in"
        end
    end

end
