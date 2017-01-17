class AddCarOptionToCar < ActiveRecord::Migration
  def change
    add_reference :cars, :car_option, index: true
    add_foreign_key :cars, :car_options
  end
end
