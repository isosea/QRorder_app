class CartsController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

  def show
    @cart_items = current_cart.cart_items
  end

  # 商品一覧画面から、「商品購入」を押した時のアクション
  def add_item
    if @cart_item.blank?
      @cart_item = current_cart.cart_items.build(menu_id: params[:menu_id])
    end

    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to root_path
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

  private

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(menu_id: params[:menu_id])
  end
end