class CreateCarOwners < ActiveRecord::Migration
  def change
    create_table :car_owners do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
