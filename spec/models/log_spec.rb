require 'spec_helper'

describe Log do

  before(:each) do
    @client = FoursquareWrapper.new(ENV['FOURSQUARE_TEST_TOKEN'])
  end

  let(:user) do
    new_test_user = User.new
    new_test_user.token = ENV['FOURSQUARE_TEST_TOKEN']
    new_test_user.tap { new_test_user.save }
  end

  let(:checkins) do
    VCR.use_cassette('log_checkins_count') do
      @client.load_all_checkins
    end
  end

  context 'for current user' do

    describe '#load_any_checkins' do

      it 'loads all checkins for new user' do
        VCR.use_cassette('log_checkins') do
          Log.load_any_checkins(user)
          user.logs.count.should == checkins.count
        end
      end

      # it 'loads any new checkins for existing user'
      # it 'doesnt load any checkins if no new ones'
      # it 'doesnt load any checkins if user has no checkins'

    end

    # describe '#sparklines' do
    #   it 'displays sparklines'
    # end

  end
end