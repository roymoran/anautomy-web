class CreateCouponFunds < ActiveRecord::Migration
  def change
    create_table :coupon_funds do |t|
      t.integer :initial_amount
      t.integer :spent_amount
      t.integer :remaining_amount
    end
  end
end
