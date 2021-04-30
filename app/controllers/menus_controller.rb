class MenusController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]

 def index
  @item_number = 0
  gon.number = @item_number
  @cart_items = current_cart.cart_items
  @menus = Menu.all
 end

 def show
  @p = 1
  gon.number = @p
  @menu = Menu.find_by(id:1)
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
 end

 def new
  @menu = Menu.new if logged_in?
 end

 def create
  @menu = Menu.new(menu_params)
  @menu.image.attach(params[:menu][:image])
    if @menu.save
      flash[:success] = "Menu item created!"
      redirect_to root_url
    else
      render 'menus/new'
    end
 end

 def destroy
  menu = Menu.find_by(id: params[:id])
  menu.destroy
  flash[:success] = "Menu deleted"
  redirect_to request.referrer || root_url
 end

 private

  def menu_params
    params.require(:menu).permit(:content, :name, :price, :image)
  end
end
