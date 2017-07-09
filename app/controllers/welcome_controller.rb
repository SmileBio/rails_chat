class WelcomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @g_rooms = GlobalRoom.includes(:users).where(users: {id: current_user.id})
    @users = User.all
  end
end
