class RemoveZipFromRepairSubmissions < ActiveRecord::Migration
  def change
    remove_column :repair_submissions, :zip, :integer
  end
end
