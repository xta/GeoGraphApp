class FoursquareWrapper

  attr_accessor :endpoint_url, :checkins

  def initialize(endpoint, token, options={})
    target_url = "https://api.foursquare.com/v2/" + endpoint + "?oauth_token=#{token}&v=20121118"

    unless options.empty?
      options.each do |k,v| 
        target_url += "&"
        target_url += k.to_s
        target_url += "="
        target_url += v.to_s
      end
    end

    @endpoint_url = target_url
  end

    def checkins

      if connected?
        # response
      else
        return false
      end

    end

  private

    def response
      connection(@endpoint_url)
    end

    def connection(url)
      conn = Faraday.new(:url => @endpoint_url)
      response = conn.get
    end

    def status_code
      JSON.parse(response.body)["meta"]["code"]
    end

    def connected?
      status_code == 200 ? true : false
    end
 
end
