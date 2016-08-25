class RemoveVehicleModelFromRepairSubmissions < ActiveRecord::Migration
  def change
  	remove_column :repair_submissions, :vehicle_model, :string
  end
end
