class NameChange < ActiveRecord::Migration
  def change

  	rename_column :repair_submissions, :vehicleYear, :vehicle_year
    rename_column :repair_submissions, :vehicleMake, :vehicle_make
    rename_column :repair_submissions, :vehicleModel, :vehicle_model
    rename_column :repair_submissions, :vehicleTrim, :vehicle_trim
    rename_column :repair_submissions, :vehicleMileage, :vehicle_mileage
    rename_column :repair_submissions, :repairDescription, :repair_description
    rename_column :repair_submissions, :partsCost, :parts_cost
    rename_column :repair_submissions, :laborCost, :labor_cost
    rename_column :repair_submissions, :shopName, :shop_name
    rename_column :repair_submissions, :shopCityState, :shop_city_state
  end
end
