class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :shop_name
      t.string :shop_zip
      t.string :shop_city
      t.string :shop_state_code
      t.string :shop_country_code
      t.string :shop_neighborhood
      t.string :shop_address
      t.boolean :shop_claimed, :default=>false

      t.timestamps null: false
    end
  end
end
