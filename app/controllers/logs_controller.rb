class LogsController < ApplicationController

  # before_filter :setup_foursquare_client

  def index
    if current_user
      Log.load_any_checkins(current_user) 
      @logs = current_user.logs
    end
  end
  
end
