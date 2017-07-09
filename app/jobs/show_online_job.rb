class ShowOnlineJob < ApplicationJob
  queue_as :default

  def perform(*args)
    users = User.all.map{|user| {id: user.id, email: user.email, online: user.is_online?}}
    ActionCable.server.broadcast "users_welcome", users
  end


end
