class OrdersController < ApplicationController
  def show
    @history_items = HistoryItem.all.order(created_at: :desc)
  end
end