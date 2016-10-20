class AddRepairNameToRepairs < ActiveRecord::Migration
  def change
  	add_reference :repairs, :repair_name, index: true
    add_foreign_key :repairs, :repair_names
  end
end
