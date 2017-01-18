class AddCarOwnerToCar < ActiveRecord::Migration
  def change
    add_reference :cars, :car_owner, index: true
    add_foreign_key :cars, :car_owners
    add_column :car_owners, :cars_count, :integer, :default=>0
  end
end
