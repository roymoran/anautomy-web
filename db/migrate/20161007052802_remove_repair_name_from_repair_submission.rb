class RemoveRepairNameFromRepairSubmission < ActiveRecord::Migration
  def change
  	remove_column :repair_submissions, :repair_name, :string
  end
end
