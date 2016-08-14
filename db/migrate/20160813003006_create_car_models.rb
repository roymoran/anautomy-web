class CreateCarModels < ActiveRecord::Migration
  def change
    create_table :car_models do |t|
      t.string :name
      t.references :car_make, index: true

      t.timestamps null: false
    end
    add_foreign_key :car_models, :car_makes
  end
end
