class AddRepairSubmissionsCountToShop < ActiveRecord::Migration
  def change
    add_column :shops, :repair_submissions_count, :integer, :default=>0
  end
end
