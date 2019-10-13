# frozen_string_literal: true

# RoomChannel.broadcast_to :public, a: 1, b: 2
class RoomChannel < ApplicationCable::Channel
  def subscribed
    return reject unless current_user

    stream_for stream_key
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def message(data)
    message = data['content']
    sleep(1)
    reply "Did you say #{message} ???"
  end

  private

  def stream_key
    params[:room]
  end
end
