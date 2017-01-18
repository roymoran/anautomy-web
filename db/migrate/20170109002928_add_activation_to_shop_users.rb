class AddActivationToShopUsers < ActiveRecord::Migration
  def change
    add_column :shop_users, :activation_digest, :string
    add_column :shop_users, :activated, :boolean, default: false
    add_column :shop_users, :activated_at, :datetime
  end
end
