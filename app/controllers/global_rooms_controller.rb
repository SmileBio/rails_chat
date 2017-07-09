class GlobalRoomsController < ApplicationController

  before_action :authenticate_user!
  before_action :load_g_room, only: [:edit, :update]


  def show
    @g_room = GlobalRoom.where(id: params[:id]).eager_load(:users).first
    @messages = Message.where(room_id: params[:id]).order(created_at: "DESC").includes(:user).limit(10).reverse
  end

  def new
    @users = User.where.not(id: current_user.id)
    @g_room = GlobalRoom.new
  end

  def edit
    @users = User.where.not(id: current_user.id)
  end

  def create
    @g_room = GlobalRoom.new(g_room_params)
    if @g_room.save
      redirect_to global_room_path(@g_room)
    else
      @users = User.where.not(id: current_user.id)
      render "new"
    end
  end

  def update
    if @g_room.update_attributes(g_room_params)
      redirect_to global_room_path(@g_room)
    else
      @users = User.where.not(id: current_user.id)
      render "edit"
    end
  end

  private
    def g_room_params
      params[:global_room][:user_ids] << current_user.id
      params.require(:global_room).permit(:title, users_attributes: [:id ], user_ids: []).merge(
       owner_id: current_user.id)
    end

    def load_g_room
      @g_room = GlobalRoom.find_by(id: params[:id])
      redirect_to global_room_path(@g_room), notice: "not enough minerals" if @g_room.owner_id != current_user.id
    end

end
