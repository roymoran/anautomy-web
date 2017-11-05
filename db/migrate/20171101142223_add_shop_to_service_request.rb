class AddShopToServiceRequest < ActiveRecord::Migration
  def change
  	add_reference :service_requests, :shop, index: true
    add_foreign_key :service_requests, :shops
  end
end
