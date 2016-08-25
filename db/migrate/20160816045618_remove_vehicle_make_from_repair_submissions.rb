class RemoveVehicleMakeFromRepairSubmissions < ActiveRecord::Migration
  def change
  	remove_column :repair_submissions, :vehicle_make, :string
  end
end
