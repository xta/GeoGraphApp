require 'spec_helper'

describe FoursquareWrapper do

  before(:each) do
    @client = FoursquareWrapper.new(ENV['FOURSQUARE_TEST_TOKEN'])
  end

  context 'for current user' do

    describe '#load_all_checkins' do

      it 'gets all checkins' do
        VCR.use_cassette('load_all_checkins') do
          checkins = @client.load_all_checkins
          checkins.count.should == 63
        end
      end
      
    end

    describe '#load_any_new_checkins' do

      it 'gets any new checkins that are not loaded yet (or missing)' do
        VCR.use_cassette('load_any_new_checkins') do
          @client.load_all_checkins
          5.times { @client.all_checkins.pop }
          @client.load_any_new_checkins
          @client.all_checkins.count.should == 64
        end
      end

    end

    # users/self/checkins
    describe '#first_checkin' do

      it 'gets the first (oldest) user checkin' do
        VCR.use_cassette('users_checkins_oldest') do
          checkin = @client.first_checkin
          checkin.venue.name.should == "No. 7 Sub @ The Ace Hotel"
        end
      end

    end

    # users/self/checkins
    describe '#latest_checkin' do

      it 'gets the last (newest) user checkin' do
        VCR.use_cassette('users_checkins_newest') do
          checkin = @client.latest_checkin
          checkin.venue.name.should == "Bubby's Brooklyn"
        end
      end

    end


    # venues/explore?oauth_token=#{user.token}&ll=#{xcoord},#{ycoord}&llAcc=#{accuracy}
    describe '#explore_venues' do

      it 'gets nearby venues via GPS coords' do
        VCR.use_cassette('explore_nearby_venues') do
          explore = @client.explore_venues(:ll => '40.7,-74')
          explore.count.should == 30
        end
      end

    end

    # https://api.foursquare.com/v2/venues/search?ll=#{URI.escape(gps_lat)},#{URI.escape(gps_lon)}
    # &query=#{URI.escape(search_query)}&limit=10
    describe '#search_venues' do

      it 'gets venues by search params' do
        VCR.use_cassette('search_nearby_venues') do
          search = @client.search_venues(:ll => '40.7,-74', :query => 'Sushi', :limit => 10)
          search.count.should == 10
          search.first.name.should == "Haru Wall Street"
        end
      end

    end

    # checkins/add&venueId=#{venue_id}
    describe '#add_checkin' do

      it 'creates a new checkin on foursquare service' do
        VCR.use_cassette('create_new_checkin') do
          @client.add_checkin(:venueId => "49e7b63df964a5200e651fe3")

          # was 63 before test, see #load_all_checkins
            @all_checkins = []
            recheck = @client.load_all_checkins
          recheck.count.should == 64
        end
      end

    end

  end
end