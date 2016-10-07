class CreateRepairNames < ActiveRecord::Migration
  def change
    create_table :repair_names do |t|
      t.string :name
      t.references :repair_category, index: true

      t.timestamps null: false
    end
    add_foreign_key :repair_names, :repair_categories
  end
end
