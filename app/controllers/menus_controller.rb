class MenusController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]

 def index
  @cart_items = current_cart.cart_items
  @menus = Menu.all
 end

 def show
  @menu = Menu.find_by(id: params[:id])
 end

 def confirm
  @cart_items = current_cart.cart_items
  @cart = current_cart
 end

 def history
  @history_items = current_history.history_items
 end

 def check
  @history_items = current_history.history_items
 end

 def thanks
  history = current_history
  history.destroy
  if current_cart
    cart = current_cart
    cart.destroy
  end
  session.delete(:cart_id)
  session.delete(:history_id)
  session.delete(:table_id)
 end

 def new
  if logged_in?
    @menu = Menu.new 
  else
    flash[:danger] = "ログインしてください"
    render 'menus/new'
  end
 end

 def create
  @menu = Menu.new(menu_params)
  @menu.image.attach(params[:menu][:image])
    if @menu.save
      flash[:success] = "メニューが追加されました"
      redirect_to root_url
    else
      flash[:danger] = "ログインしてください"
      render 'menus/new'
    end
 end

 def destroy
  menu = Menu.find_by(id: params[:id])
  menu.destroy
  flash[:success] = "メニューが削除されました"
  redirect_to request.referrer || root_url
 end

 private

  def menu_params
    params.require(:menu).permit(:content, :name, :price, :image, :category)
  end
end
