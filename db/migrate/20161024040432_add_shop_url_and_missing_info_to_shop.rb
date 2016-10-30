class AddShopUrlAndMissingInfoToShop < ActiveRecord::Migration
  def change
  	add_column :shops, :missing_info, :boolean, :default => false
  	add_column :shops, :shop_url, :string
  end
end
