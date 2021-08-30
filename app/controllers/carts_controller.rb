class CartsController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

  def show
    @cart_items = current_cart.cart_items
  end

  # 商品一覧画面から、「追加」を押した時のアクション
  def add_item
    if params[:id] == "plus"
      @cart_item.quantity = params[:quantity].to_i + 1
    elsif params[:id] == "minus"
      @cart_item.quantity = params[:quantity].to_i - 1
    else
      flash[:danger] = "不具合が発生しました"
      render root_path
    end

    @cart_items = current_cart.cart_items

    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to root_path(category: params[:category]) } 
        format.js  # .js.erbが呼び出される
      else
        format.html { render :new } # .html.erbを表示
        format.js { render :errors } # 一番最後に実装の解説あります
      end
    end
  end

  # カート詳細画面から、「更新」を押した時のアクション
  def update_item
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to confirm_path
  end

  # カート詳細画面から、「削除」を押した時のアクション
  def delete_item
    item = CartItem.find_by(id: params[:id])
    item.destroy
    redirect_to confirm_path
  end

  def create
    @cart = Cart.create
    session[:cart_id] = @cart.id
    redirect_to history_path
  end

  def destroy
    cart = Cart.find_by(id: params[:id])
    cart.cart_items.each do |cart_item|
      history_item = current_history.history_items.build(quantity: cart_item.quantity, menu_id: cart_item.menu_id, tables_id: session[:table_id])
      history_item.save
    end

    current_cart.destroy
    session.delete(:cart_id)
    redirect_to root_path, flash: {success: "注文を承りました"}
  end

  private

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(menu_id: params[:menu_id])
  end
end