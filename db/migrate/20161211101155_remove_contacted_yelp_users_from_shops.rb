class RemoveContactedYelpUsersFromShops < ActiveRecord::Migration
  def change
  	remove_column :shops, :contacted_yelp_users, :string
  end
end
