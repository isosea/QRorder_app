class CheckChannel < ApplicationCable::Channel
  def subscribed
    stream_from "check_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
