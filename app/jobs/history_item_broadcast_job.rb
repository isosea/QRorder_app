class HistoryItemBroadcastJob < ApplicationJob
  queue_as :default

  def perform(order)
    ActionCable.server.broadcast 'order_channel', order: render_order(order)
  end

  private

    def render_order(order)
      ApplicationController.renderer.render(partial: 'orders/order', locals: { order: order })
    end
end
