class CreateRepairs < ActiveRecord::Migration
  def change
    create_table :repairs do |t|
      t.references :repair_submission, index: true

      t.timestamps null: false
    end
    add_foreign_key :repairs, :repair_submissions
  end
end
