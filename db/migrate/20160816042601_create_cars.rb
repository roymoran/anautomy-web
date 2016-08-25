class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.references :car_make, index: true
      t.references :car_model, index: true

      t.timestamps null: false
    end
    add_foreign_key :cars, :car_makes
    add_foreign_key :cars, :car_models
  end
end
