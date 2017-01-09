class AddActivationToCarOwners < ActiveRecord::Migration
  def change
    add_column :car_owners, :activation_digest, :string
    add_column :car_owners, :activated, :boolean, default: false
    add_column :car_owners, :activated_at, :datetime
  end
end
