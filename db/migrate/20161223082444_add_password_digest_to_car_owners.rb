class AddPasswordDigestToCarOwners < ActiveRecord::Migration
  def change
    add_column :car_owners, :password_digest, :string
  end
end
