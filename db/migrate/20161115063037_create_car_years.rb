class CreateCarYears < ActiveRecord::Migration
  def change
    create_table :car_years do |t|
      t.integer :year

      t.timestamps null: false
    end
  end
end
