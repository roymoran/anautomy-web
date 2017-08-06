class AddCurrentMileageToCars < ActiveRecord::Migration
  def change
    add_column :cars, :current_mileage, :integer
  end
end
