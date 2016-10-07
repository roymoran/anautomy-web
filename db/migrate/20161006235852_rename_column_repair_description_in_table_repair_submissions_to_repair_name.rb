class RenameColumnRepairDescriptionInTableRepairSubmissionsToRepairName < ActiveRecord::Migration
  def change
  	rename_column :repair_submissions, :repair_description, :repair_name
  end
end
