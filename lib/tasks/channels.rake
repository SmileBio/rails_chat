namespace :channels do
  namespace :wellcome do
    task send_active_users: :environment do |task|
      #TestJob.perform_later
      users = User.all.map{|user| {id: user.id, email: user.email, online: user.is_online?}}
      ActionCable.server.broadcast "welcome", users
    end
  end
end
