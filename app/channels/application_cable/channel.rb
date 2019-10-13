# frozen_string_literal: true

module ApplicationCable
  class Channel < ActionCable::Channel::Base
    protected

    def stream_key
      raise 'overide this method'
    end

    def reply(content)
      from = caller[0].match(/`(.+)'/)[1]
      response = params.dup.merge(from: from, content: content)
      self.class.broadcast_to(stream_key, response)
    end
  end
end
