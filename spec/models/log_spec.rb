require 'spec_helper'

describe Log do

  before(:each) do
    @client = FoursquareWrapper.new(ENV['FOURSQUARE_TEST_TOKEN'])
  end

  let(:checkins) do
    VCR.use_cassette('log_checkins') do
      @client.load_all_checkins
    end
  end

  let(:checkins_count) do
    checkins.count
  end

  context 'for current user' do
    describe '#store_checkins' do

      it 'accepts an array of checkins and saves it as a log' do

        lambda do
          Log.store_checkins(checkins)
        end.should change(Log, :count).by(checkins_count)

      end

    end

    # describe '#sparklines' do
    #   it 'displays sparklines'
    # end

  end
end