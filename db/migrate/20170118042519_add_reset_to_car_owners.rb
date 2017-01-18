class AddResetToCarOwners < ActiveRecord::Migration
  def change
    add_column :car_owners, :reset_digest, :string
    add_column :car_owners, :reset_sent_at, :datetime
  end
end
