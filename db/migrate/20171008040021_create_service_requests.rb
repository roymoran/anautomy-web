class CreateServiceRequests < ActiveRecord::Migration
  def change
    create_table :service_requests do |t|
      t.string :car_owner_id, index: true
      t.references :car, index: true
      t.string :repair_name
      t.string :pickup_location
      t.string :car_location
      t.integer :quote_amount
      t.integer :actual_amount
      t.string :status
      t.string :assigned_driver_name
      t.string :assigned_driver_number
      t.string :assigned_driver_image
      t.string :assigned_driver_info

      t.timestamps null: false
    end
    add_foreign_key :service_requests, :car_owners
  end
end
