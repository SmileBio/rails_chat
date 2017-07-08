class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data)
    ActionCable.server.broadcast "messages", data
  end
end
