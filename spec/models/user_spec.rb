require 'spec_helper'

describe User do

    let(:auth) do
      OmniAuth::AuthHash.new({  
        :provider => 'foursquare',
        :uid => '12345678',
        :info => {        :email => "foo@bar.com",
                          :first_name => "Foobaz",
                          :last_name => "Bazbar",
                          :location => "New York"
                  },
        :credentials => {
                          :token => "tokengoeshere"
                  }
      })
    end

  describe ".from_omniauth" do

    it 'finds the user in the database if already exist'

    it 'triggers create_from_omniauth if user does not exist'

  end

  describe ".create_from_omniauth" do

    it 'creates a user from foursquare response' do
      # user should not exist
      # stub the method
      # user should exist
    end

    it 'should not create a user if invalid foursquare response'

  end

end