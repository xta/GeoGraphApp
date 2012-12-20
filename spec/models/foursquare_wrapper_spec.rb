require 'spec_helper'

describe FoursquareWrapper do

  context 'for all foursquare API calls' do
    describe '#connected?' do

      it 'returns true if response is 200 OK' do

        VCR.use_cassette('response_ok') do
          foursquare = FoursquareWrapper.new("users/self/checkins", ENV['FOURSQUARE_TEST_TOKEN'], :limit => 1, :sort => "oldestfirst" )
          foursquare.connected?.should == true
        end
      end

      it 'returns false if error (not 200 response)' do
        VCR.use_cassette('response_invalid') do
          foursquare = FoursquareWrapper.new("users/self/checkins", "foobar_not_key_here", :limit => 1, :sort => "oldestfirst" )
          foursquare.connected?.should == false
        end
      end

    end
  end

  context 'for current user' do
    describe '#load_all_checkins' do

      it 'gets all checkins'

    end

    describe '#load_any_new_checkins' do

      it 'gets any new checkins'

    end

    describe '#first_user_checkin' do

      it 'gets the first (oldest) user checkin'

    end

    describe '#latest_user_checkin' do

      it 'gets the last (newest) user checkin'

    end

    describe '#get_nearby_venues' do

      it 'gets nearby venues via GPS coords'

    end

    describe '#search_nearby_venues' do

      it 'gets venues by search params'

    end

    describe '#create_foursquare_checkin' do

      it 'posts a new checkin'

    end

    describe '#save_foursquare_checkin' do

      it 'saves a successful foursquare checkin'

    end

  end
end