require 'spec_helper'

describe Log do

  before(:each) do
    @client = FoursquareWrapper.new(ENV['FOURSQUARE_TEST_TOKEN'])
  end

  let(:user) { User.create(:id => 5000) }
  let(:user_id) { user.id }

  let(:checkins) do
    VCR.use_cassette('log_checkins') do
      @client.load_all_checkins
    end
  end

  let(:checkins_count) { checkins.count }

  context 'for current user' do
    describe '#store_checkins' do

      it 'accepts an array of checkins and saves it as a log' do

        Log.store_checkins(user_id, checkins)
        user.logs.count.should == checkins_count

      end

    end

    # describe '#sparklines' do
    #   it 'displays sparklines'
    # end

  end
end