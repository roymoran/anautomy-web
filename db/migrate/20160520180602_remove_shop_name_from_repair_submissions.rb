class RemoveShopNameFromRepairSubmissions < ActiveRecord::Migration
  def change
    remove_column :repair_submissions, :shop_name, :string
  end
end
