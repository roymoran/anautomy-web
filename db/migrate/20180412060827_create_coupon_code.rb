class CreateCouponCode < ActiveRecord::Migration
  def change
    create_table :coupon_codes do |t|
      t.string :code
      t.datetime :expiration_at
      t.integer :discount_percent
      t.integer :discount_amount
    end
    add_index :coupon_codes, :code, unique: true
  end
end
