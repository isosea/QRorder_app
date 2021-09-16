class MenusController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :create, :destroy]

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
    @menu = Menu.new 
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.image.attach(params[:menu][:image])
      if @menu.save
        flash[:success] = "メニューが追加されました"
        redirect_to root_url
      else
        flash.now[:danger] = "不具合が発生しました"
        render 'menus/new'
      end
  end

  def edit
    @menu = Menu.find_by(id: params[:id])
  end
  
  def update
    @menu = Menu.find_by(id: params[:id])
    if @menu.update(menu_params)
      flash[:success] = "メニュー内容が更新されました"
      redirect_to root_url
    else
      flash.now[:danger] = "不具合が発生しました"
      render 'edit'
    end
  end

  def destroy
    menu = Menu.find_by(id: params[:id])
    menu.destroy
    flash[:success] = "メニューが削除されました"
    redirect_to request.referrer || root_url
  end

  def sold_out
    menu = Menu.find_by(id: params[:id])
    menu.existence = !menu.existence
    menu.save
    redirect_to root_url
  end

  private

    def menu_params
      params.require(:menu).permit(:content, :name, :price, :image, :category)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
end
