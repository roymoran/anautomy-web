class CreateShopUsers < ActiveRecord::Migration
  def change
    create_table :shop_users do |t|
    	t.string :first_name
      t.string :last_name
    	t.string :email
    	t.string :password_digest
    	t.string :remember_digest

      t.timestamps null: false
    end
    add_index :shop_users, :email, unique: true
  end
end
