class CreateRepairSubmissions < ActiveRecord::Migration
  def change
    create_table :repair_submissions do |t|
      t.string :email
      t.integer :vehicleYear
      t.string :vehicleMake
      t.string :vehicleModel
      t.string :vehicleTrim
      t.integer :vehicleMileage
      t.string :repairDescription
      t.decimal :partsCost
      t.decimal :laborCost
      t.text :vechicleDetails
      t.text :repairDetails

      t.timestamps null: false
    end
  end
end
