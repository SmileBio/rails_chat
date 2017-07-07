class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  after_filter :set_online

  private

    def set_online
      if !!current_user
        # не нужно значение, нужен только ключ
        $redis_onlines.set( current_user.id, nil, ex: 5*60 )
        # `ex: 5*60` - устанавливаем время жизни ключа - 5 минут, через 5 мину ключ удалиться
      end
    end
end
