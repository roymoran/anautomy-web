class AddCarImageToCars < ActiveRecord::Migration
  def change
  	add_column :cars, :car_image, :string
  end
end
