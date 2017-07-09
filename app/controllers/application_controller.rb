class ApplicationController < ActionController::Base

  protect_from_forgery prepend: true
  after_filter :set_online


  private

    def set_online
      if !!current_user
        $redis_onlines.set( current_user.id, nil, ex: 5*60 )
      end
    end
end
