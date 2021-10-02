class OrdersController < ApplicationController
  def show
    @history_items = HistoryItem.all.order(created_at: :desc)
  end

  def checked
    order = HistoryItem.find_by(id: params[:id])
    order.toggle(:checked)
    order.save
    redirect_to order_path
  end
end