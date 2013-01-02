class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # def setup_foursquare_client
  #   if current_user
  #    @foursquare_client = FoursquareWrapper.new(current_user.token)
  #   end
  # end
  # helper_method :foursquare_client
  
end
