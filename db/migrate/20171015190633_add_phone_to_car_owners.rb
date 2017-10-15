class AddPhoneToCarOwners < ActiveRecord::Migration
  def change
  	add_column :car_owners, :phone_number, :string
  end
end
