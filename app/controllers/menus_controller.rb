class MenusController < ApplicationController

 def index
  @menu1 = Menu.find_by(id: 1)
  @menu2 = Menu.find_by(id: 2)
  @item_number1 = 2
  @item_number2 = 3
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
end
