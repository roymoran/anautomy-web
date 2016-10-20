class RemoveRepairDescriptionFromRepairSubmissions < ActiveRecord::Migration
  def change
  	remove_column :repair_submissions, :repair_description, :string
  end
end
