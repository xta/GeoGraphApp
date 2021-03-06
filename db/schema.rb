# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130102080824) do

  create_table "logs", :force => true do |t|
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "ci_id"
    t.integer  "ci_created"
    t.string   "ci_type"
    t.string   "ci_timezoneoffset"
    t.string   "ci_venue_id"
    t.string   "ci_venue_name"
    t.string   "ci_venue_location_address"
    t.string   "ci_venue_location_city"
    t.string   "ci_venue_location_state"
    t.string   "ci_venue_location_crossStreet"
    t.string   "ci_venue_location_postalCode"
    t.string   "ci_venue_location_country"
    t.string   "ci_venue_location_cc"
    t.string   "ci_venue_location_lat"
    t.string   "ci_venue_location_lng"
    t.string   "ci_venue_categories_id"
    t.string   "ci_venue_categories_name"
    t.string   "source"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.string   "email"
    t.string   "location"
  end

  create_table "venues", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
