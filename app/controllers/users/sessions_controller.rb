class Users::SessionsController < Devise::SessionsController
  def destroy
    $redis_onlines.del(current_user.id)
    ShowOnlineJob.perform_later
    super

  end
end
