class AddShopClosedToShop < ActiveRecord::Migration
  def change
    add_column :shops, :shop_closed, :boolean, :default=>false
  end
end
