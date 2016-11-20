class AddCarYearToCars < ActiveRecord::Migration
  def change
    add_reference :cars, :car_year, index: true
    add_foreign_key :cars, :car_years
  end
end
