class CheckedBroadcastJob < ApplicationJob
  queue_as :checked

  def perform(order)
    ActionCable.server.broadcast 'check_channel', render: render_order(order), order: order 
  end

  private
    
    def render_order(order)
      ApplicationController.renderer.render(partial: 'orders/order', locals: { order: order })
    end
end
