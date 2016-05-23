class AddShopPhoneToShop < ActiveRecord::Migration
  def change
    add_column :shops, :shop_phone, :string
  end
end
