class FoursquareWrapper

  attr_accessor :client

  def initialize(token)
    @client = Foursquare2::Client.new(:oauth_token => token)
  end

  def user_checkins(options={})
    @client.user_checkins(options).items.first
  end

  def explore_venues(options={})
    @client.explore_venues(options).groups.first.items
  end
 
end
