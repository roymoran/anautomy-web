class AddYelpContactDateToShops < ActiveRecord::Migration
  def change
  	add_column :shops, :yelp_contact_date, :string
  end
end
