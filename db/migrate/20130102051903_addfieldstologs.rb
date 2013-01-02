class Addfieldstologs < ActiveRecord::Migration

  def change
    add_column :logs, :ci_id, :string
    add_column :logs, :ci_created, :integer
    add_column :logs, :ci_type, :string
    add_column :logs, :ci_timezoneoffset, :string

    add_column :logs, :ci_venue_id, :string
    add_column :logs, :ci_venue_name, :string
    add_column :logs, :ci_venue_location_address, :string
    add_column :logs, :ci_venue_location_city, :string
    add_column :logs, :ci_venue_location_state, :string
    add_column :logs, :ci_venue_location_crossStreet, :string
    add_column :logs, :ci_venue_location_postalCode, :string
    add_column :logs, :ci_venue_location_country, :string
    add_column :logs, :ci_venue_location_cc, :string
    add_column :logs, :ci_venue_location_lat, :string
    add_column :logs, :ci_venue_location_lng, :string
    add_column :logs, :ci_venue_categories_id, :string
    add_column :logs, :ci_venue_categories_name, :string

    add_column :logs, :source, :string
  end

end