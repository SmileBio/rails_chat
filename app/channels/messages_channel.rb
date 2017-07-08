class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    message = Message.create(context: data["context"], user_id: data["user_id"], room_id: data["room_id"])
  end
end
