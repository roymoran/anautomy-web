class AddColumnShopMasterRatingToShop < ActiveRecord::Migration
  def change
  	add_column :shops, :shop_master_rating, :float
  end
end
