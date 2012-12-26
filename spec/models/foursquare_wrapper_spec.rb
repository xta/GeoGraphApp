require 'spec_helper'

describe FoursquareWrapper do

  before(:each) do
    @client = FoursquareWrapper.new(ENV['FOURSQUARE_TEST_TOKEN'])
  end

  context 'for current user' do
    # describe '#load_all_checkins' do
    #   it 'gets all checkins'
    # end

    # describe '#load_any_new_checkins' do
    #   it 'gets any new checkins'
    # end

    # users/self/checkins
    describe '#first_user_checkin' do

      it 'gets the first (oldest) user checkin' do
        VCR.use_cassette('users_checkins_oldest') do
          checkin = @client.user_checkins(:limit => 1, :sort => 'oldestfirst')
          checkin.items.count.should == 1
          checkin.items.first.venue.name.should == "No. 7 Sub @ The Ace Hotel"
        end
      end

    end

    # users/self/checkins
    describe '#latest_user_checkin' do

      it 'gets the last (newest) user checkin' do
        VCR.use_cassette('users_checkins_newest') do
          checkin = @client.user_checkins(:limit => 1, :sort => 'newestfirst')
          checkin.items.count.should == 1
          checkin.items.first.venue.name.should == "Bubby's Brooklyn"
        end
      end

    end


    # venues/explore?oauth_token=#{user.token}
    # &ll=#{xcoord},#{ycoord}
    # &llAcc=#{accuracy}
    describe '#get_nearby_venues' do

      it 'gets nearby venues via GPS coords'

    end

    # https://api.foursquare.com/v2/venues/search
    # ?ll=#{URI.escape(gps_lat)},#{URI.escape(gps_lon)}
    # &llAcc=#{URI.escape(gps_acc)}
    # &query=#{URI.escape(search_query)}
    # &limit=10&intent=checkin
    describe '#search_nearby_venues' do

      it 'gets venues by search params'

    end



    # checkins/add
    # &venueId=#{venue_id}
    # :body => {:four => :square}
    describe '#create_foursquare_checkin' do

      it 'posts a new checkin'

    end

    # describe '#save_foursquare_checkin' do

    #   it 'saves a successful foursquare checkin'

    # end

  end
end