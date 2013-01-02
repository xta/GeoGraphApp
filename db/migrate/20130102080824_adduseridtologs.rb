class Adduseridtologs < ActiveRecord::Migration
  def up
    add_column :logs, :user_id, :integer
  end

  def down
    remove_column :logs, :user_id
  end
end
