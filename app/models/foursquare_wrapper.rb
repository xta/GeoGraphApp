class FoursquareWrapper

  attr_accessor :client

  def initialize(token)
    @client = Foursquare2::Client.new(:oauth_token => token)
  end

  def user_checkins(options={})
    @client.user_checkins(options)
  end
 
end
