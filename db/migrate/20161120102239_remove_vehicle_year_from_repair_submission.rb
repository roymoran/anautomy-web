class RemoveVehicleYearFromRepairSubmission < ActiveRecord::Migration
  def change
  	 remove_column :repair_submissions, :vehicle_year, :string
  end
end
