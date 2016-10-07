class CreateRepairs < ActiveRecord::Migration
  def change
    create_table :repairs do |t|
      t.references :repair_submission, index: true
      t.references :repair_category, index: true
      t.references :repair_name, index: true

      t.timestamps null: false
    end
    add_foreign_key :repairs, :repair_submissions
    add_foreign_key :repairs, :repair_categories
    add_foreign_key :repairs, :repair_names
  end
end
