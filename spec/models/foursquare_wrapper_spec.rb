require 'spec_helper'

describe FoursquareWrapper do

  context 'for a foursquare API call' do
    describe '.api_success?' do

      it 'returns true if response is 200 OK'

      it 'returns false if error (not 200 response)'

      it 'returns false if rate limit exceeded'

    end
  end

  context 'for current user' do
    describe '.load_all_checkins' do

      it 'gets all checkins'

    end

    describe '.load_any_new_checkins' do

      it 'gets any new checkins'

    end

    describe '.first_user_checkin' do

      it 'gets the first (oldest) user checkin'

    end

    describe '.latest_user_checkin' do

      it 'gets the last (newest) user checkin'

    end

    describe '.get_nearby_venues' do

      it 'gets nearby venues via GPS coords'

    end

    describe '.search_nearby_venues' do

      it 'gets venues by search params'

    end

    describe '.create_foursquare_checkin' do

      it 'posts a new checkin'

    end

    describe '.save_foursquare_checkin' do

      it 'saves a successful foursquare checkin'

    end

  end
end