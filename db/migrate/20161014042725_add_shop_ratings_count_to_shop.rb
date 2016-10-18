class AddShopRatingsCountToShop < ActiveRecord::Migration
  def change
  	add_column :shops, :shop_ratings_count, :integer, :default=>0
  end
end
