class WelcomeController < ApplicationController

  before_action :authenticate_user!

  def index
    #users = $redis_onlines.keys
    @users = User.all#.map{|user| {id: user.id, email: user.email, online: user.is_online?}}
  end
end
