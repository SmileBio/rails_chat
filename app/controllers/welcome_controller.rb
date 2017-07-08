class WelcomeController < ApplicationController

  before_action :authenticate_user!

  def index
    TestJob.perform_later()
    #users = $redis_onlines.keys
    @users = User.all#.map{|user| {id: user.id, email: user.email, online: user.is_online?}}
  end
end
