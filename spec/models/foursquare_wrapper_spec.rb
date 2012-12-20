require 'spec_helper'

describe FoursquareWrapper do

#private call
  # context 'for all foursquare API calls' do
  #   describe '#connected?' do

  #     it 'returns true if response is 200 OK' do

  #       VCR.use_cassette('response_ok') do
  #         foursquare = FoursquareWrapper.new("users/self/checkins", ENV['FOURSQUARE_TEST_TOKEN'], :limit => 1, :sort => "oldestfirst" )
  #         foursquare.connected?.should == true
  #       end
  #     end

  #     it 'returns false if error (not 200 response)' do
  #       VCR.use_cassette('response_invalid') do
  #         foursquare = FoursquareWrapper.new("users/self/checkins", "foobar_not_key_here", :limit => 1, :sort => "oldestfirst" )
  #         foursquare.connected?.should == false
  #       end
  #     end

  #   end
  # end

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
        # VCR.use_cassette('users_checkins_oldest') do
        #   foursquare = FoursquareWrapper.new("users/self/checkins", ENV['FOURSQUARE_TEST_TOKEN'], :limit => 1, :sort => "oldestfirst" )
        #   foursquare.checkins.count.should == 1
        # end
      end

    end

    # users/self/checkins
    describe '#latest_user_checkin' do

      it 'gets the last (newest) user checkin'

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