class CreateRepairCategories < ActiveRecord::Migration
  def change
    create_table :repair_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
