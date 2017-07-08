class RoomsController < ApplicationController
  before_action :load_room, only: [:show]


  def show
    puts session#cookies[:_session_id]
  end


  def create
    @rooms = Room.where(room_type: 0).includes(:users)
    @rooms = @rooms.where(users: {id: [current_user.id, params[:user_id]]})

    @rooms.each do |room|
      return redirect_to room_path(room) if room.users.size == 2
    end


    user = User.find_by_id(params[:user_id])
    @room = Room.new(title: "#{current_user.email}, #{user.email}", room_type: 0)
    @room.users = [current_user, user]
    if @room.save
      return redirect_to room_path(@room)
      return render plain: room_path(@room)
    end

  end


  private
    def room_params
      params.require(:room).permit(:title).merge(type: 0)
    end

    def load_room
      @room = Room.includes(:users).where(id: params[:id]).first
      @messages = Message.where(room_id: @room.id).order("created_at DESC").limit(10).reverse
      #@room = @room.where(users: {id:current_user.id}).order("messages.created_at DESC").first
    end

end
