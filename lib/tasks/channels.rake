namespace :channels do
  namespace :wellcome do
    task send_active_users: :environment do |task|
      ShowOnlineJob.perform_later
    end
  end
end
