class ApplicationController < ActionController::Base
  include SessionsHelper
  
  protect_from_forgery with: :exception

  helper_method :current_cart
  helper_method :current_history

  def current_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    @cart
  end

  def current_history
    if session[:history_id]
      @history = History.find(session[:history_id])
    else
      @history = History.create
      session[:history_id] = @history.id
    end
    @history
  end

  private

    # ユーザーのログインを確認する
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
