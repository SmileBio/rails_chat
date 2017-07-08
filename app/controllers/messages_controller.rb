class MessagesController < ApplicationController

  def create
    @message = Message.new(context: params[:context], room_id: params[:room_id], user_id: current_user.id)
    if @message.save
      render json: @message
    end
  end

end
