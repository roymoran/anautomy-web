class AddStripeCustomerIdToCarOwner < ActiveRecord::Migration
  def change
  	add_column :car_owners, :stripe_customer_id, :string
  end
end
