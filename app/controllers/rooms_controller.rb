class RoomsController < ApplicationController

  before_action :authenticate_user!
  before_action :load_room, only: [:show]

  def show

  end


  def create
    if current_user.id.to_i == params[:user_id].to_i
      return redirect_to "/", notice: "с самим собой нельзя создавать чат"
    end

    @rooms = SingleRoom.includes(:users)
    @rooms = @rooms.where(users: {id: [current_user.id, params[:user_id]]})

    @rooms.each do |room|
      return redirect_to room_path(room) if room.users.size == 2
    end

    user = User.find_by_id(params[:user_id])
    @room = SingleRoom.new(title: "#{current_user.email}, #{user.email}")
    @room.users = [current_user, user]
    if @room.save
      return redirect_to room_path(@room)
    end

  end


  private
    def room_params
      params.require(:single_room).permit(:title)
    end

    def load_room
      @room = SingleRoom.includes(:users).where(id: params[:id]).first
      @messages = Message.where(room_id: @room.id).order("created_at DESC").includes(:user).limit(10).reverse
    end

end
