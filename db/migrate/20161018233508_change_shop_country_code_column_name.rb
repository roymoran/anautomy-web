class ChangeShopCountryCodeColumnName < ActiveRecord::Migration
  def change
  	rename_column :shops, :shop_country_code, :shop_iso_country_code
  end
end
