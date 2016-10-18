class CreateShopRatings < ActiveRecord::Migration
  def change
    create_table :shop_ratings do |t|
      t.integer :cost_rating
      t.integer :quality_rating
      t.integer :quickness_rating
      t.references :shop, index: true

      t.timestamps null: false
    end
    add_foreign_key :shop_ratings, :shops
  end
end
