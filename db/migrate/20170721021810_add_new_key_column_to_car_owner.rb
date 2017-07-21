class AddNewKeyColumnToCarOwner < ActiveRecord::Migration
  def change
    add_column :car_owners, :uid, :string, unique: true, null: false
  end
end
