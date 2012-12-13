class CreateFoursquares < ActiveRecord::Migration
  def change
    create_table :foursquares do |t|

      t.timestamps
    end
  end
end
