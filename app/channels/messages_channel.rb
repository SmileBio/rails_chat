class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    if file = data["file"]
      regexp = /\Adata:([-\w]+\/[-\w\+\.]+)?;base64,(.*)/m
      file = file.match(regexp) || []

      file_name = "#{SecureRandom.uuid}.#{data["filename"]}"
      File.open(Rails.root.join('public', 'uploads', file_name), 'wb') do |f|
        f.write Base64.decode64(file[2])
      end
    end
    $redis_onlines.set( data["user_id"], nil, ex: 5*60 )
    message = Message.create(context: data["context"], user_id: data["user_id"], room_id: data["room_id"], file_name: file_name)
  end
end
