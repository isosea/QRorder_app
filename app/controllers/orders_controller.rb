class OrdersController < ApplicationController
  def show
    @history_items = HistoryItem.all
  end
end