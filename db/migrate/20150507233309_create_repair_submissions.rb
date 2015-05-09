class CreateRepairSubmissions < ActiveRecord::Migration
  def change
    create_table :repair_submissions do |t|
      t.string :name
      t.integer :zip
      t.string :email
      t.integer :vehicleYear
      t.string :vehicleMake
      t.string :vehicleModel
      t.string :vehicleTrim
      t.string :vehicleMileage
      t.string :repairDescription
      t.string :partsCost
      t.string :laborCost
      t.string :shopName
      t.string :shopCityState
      t.text :review

      t.timestamps null: false
    end
  end
end
