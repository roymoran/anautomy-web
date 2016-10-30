class AddColumnToShop < ActiveRecord::Migration
  def change
  	add_column :shops, :yelp_rc, :int
  end
end
