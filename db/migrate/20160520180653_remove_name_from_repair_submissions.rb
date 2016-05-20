class RemoveNameFromRepairSubmissions < ActiveRecord::Migration
  def change
    remove_column :repair_submissions, :name, :string
  end
end
