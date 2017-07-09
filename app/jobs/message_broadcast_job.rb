class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data)
    message = ""
    message = "<p>#{data.user.email}| #{(data.created_at).strftime('%Y-%m-%d %H:%M')} -> #{data.context}</p>" if data.context.length > 0
    message += "<p>#{data.user.email}| #{(data.created_at).strftime('%Y-%m-%d %H:%M')} -> <a href=/uploads/#{data.file_name}>file</a></p>" if data.file_name
    ActionCable.server.broadcast "messages_#{data.room_id}", {data: data, message: message}
  end
end
