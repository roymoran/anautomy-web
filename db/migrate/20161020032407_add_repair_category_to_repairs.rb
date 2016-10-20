class AddRepairCategoryToRepairs < ActiveRecord::Migration
  def change
  	add_reference :repairs, :repair_category, index: true
    add_foreign_key :repairs, :repair_categories
  end
end
