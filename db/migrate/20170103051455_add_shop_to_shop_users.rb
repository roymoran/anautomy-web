class AddShopToShopUsers < ActiveRecord::Migration
  def change
    add_reference :shop_users, :shop, index: true
    add_foreign_key :shop_users, :shops
    add_column :shops, :shop_users_count, :integer, :default=>0
  end
end
