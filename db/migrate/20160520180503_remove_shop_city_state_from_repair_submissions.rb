class RemoveShopCityStateFromRepairSubmissions < ActiveRecord::Migration
  def change
    remove_column :repair_submissions, :shop_city_state, :string
  end
end
