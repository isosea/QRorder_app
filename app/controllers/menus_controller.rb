class MenusController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]

 def index
  @item_number = 1
  gon.number = @item_number
  @menus = Menu.all
 end

 def show
  @p = 1
  gon.number = @p
 end

 def confirm
 end

 def history
 end

 def check
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
  @menu.destroy
  flash[:success] = "Menu deleted"
  redirect_to request.referrer || root_url
 end

 private

  def menu_params
    params.require(:menu).permit(:content, :name, :image)
  end
end
