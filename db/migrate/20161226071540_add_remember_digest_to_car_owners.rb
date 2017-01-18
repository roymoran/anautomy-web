class AddRememberDigestToCarOwners < ActiveRecord::Migration
  def change
    add_column :car_owners, :remember_digest, :string
  end
end
