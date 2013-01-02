class Log < ActiveRecord::Base

  belongs_to :user

  alias_attribute :name, :ci_venue_name

  def self.load_any_checkins(user)
    client    = FoursquareWrapper.new(user.token)
    checkins  = client.load_all_checkins
    store_checkins(user.id, checkins)
  end

  private

    def self.store_checkins(user_id, collection)

      collection.each do |checkin|
        save_checkin(user_id, checkin)
      end

    end

    def self.save_checkin(user_id, checkin)

      begin
        new_log = self.new
        new_log.user_id = user_id
        
        new_log.ci_id = checkin.id
        new_log.ci_created = checkin.createdAt
        new_log.ci_type = checkin.type
        new_log.ci_timezoneoffset = checkin.timeZoneOffset

        new_log.ci_venue_id = checkin.venue.id
        new_log.ci_venue_name = checkin.venue.name
        new_log.ci_venue_location_address = checkin.venue.location.address
        new_log.ci_venue_location_city = checkin.venue.location.city
        new_log.ci_venue_location_state = checkin.venue.location.state
        new_log.ci_venue_location_crossStreet = checkin.venue.location.crossStreet
        new_log.ci_venue_location_postalCode = checkin.venue.location.postalCode
        new_log.ci_venue_location_country = checkin.venue.location.country
        new_log.ci_venue_location_cc = checkin.venue.location.cc
        new_log.ci_venue_location_lat = checkin.venue.location.lat
        new_log.ci_venue_location_lng = checkin.venue.location.lng

        new_log.ci_venue_categories_id = checkin.venue.categories.first.id
        new_log.ci_venue_categories_name = checkin.venue.categories.first.name

        new_log.source = "foursquare"
        new_log.save

      rescue Exception => e
        logger.debug e
      end
    end

end
