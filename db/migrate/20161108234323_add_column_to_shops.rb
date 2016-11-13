class AddColumnToShops < ActiveRecord::Migration
  def change
  	add_column :shops, :contacted_yelp_users, :boolean, :default => false
  end
end
