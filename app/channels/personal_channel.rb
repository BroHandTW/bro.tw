# frozen_string_literal: true

# PersonalChannel.broadcast_to User.first, a: 1, b: 2
class PersonalChannel < ApplicationCable::Channel
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

  def graphql(data)
    graphql = data['content']
    sleep(1)
    reply BrobaoSchema.execute(graphql).to_json
  end

  private

  def stream_key
    current_user
  end
end
