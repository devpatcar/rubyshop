class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  private

  def current_order
    if session[:order_id].nil?
      Order.new
    else     
      Order.find(session[:order_id])
    end
  end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    helper_method :current_user
    helper_method :current_order
end
