class AddLocationToCarOwners < ActiveRecord::Migration
  def change
    add_column :car_owners, :city, :string
    add_column :car_owners, :state, :string
    add_column :car_owners, :zip, :string
  end
end
