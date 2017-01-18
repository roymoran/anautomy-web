class AddRegisterIdToShops < ActiveRecord::Migration
  def change
  	 add_column :shops, :register_id, :string, unique: true
  end
end
