namespace :channels do
  namespace :wellcome do
    task send_active_users: :environment do |task|
      50.times do
        ShowOnlineJob.perform_later
        sleep 72
      end
    end
  end
end
