class AddRepairNameCustomeToRepair < ActiveRecord::Migration
  def change
  	add_column :repairs, :repair_name_custom, :string
  end
end
