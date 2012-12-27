class FoursquareWrapper

  attr_accessor :client

  def initialize(token)
    @client = Foursquare2::Client.new(:oauth_token => token)
  end

  def first_checkin
    user_checkins(:limit => 1, :sort => 'oldestfirst')
  end

  def latest_checkin
    user_checkins(:limit => 1, :sort => 'newestfirst')
  end

  def explore_venues(options={})
    @client.explore_venues(options).groups.first.items
  end

  def search_venues(options={})
    @client.search_venues(options).groups.first.items
  end

  # def load_all_checkins
  #   @client.user_checkins
  # end

  private

  def user_checkins(options={})
    @client.user_checkins(options).items.first
  end
 
end
