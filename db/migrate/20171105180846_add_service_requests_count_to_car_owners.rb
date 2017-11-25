class AddServiceRequestsCountToCarOwners < ActiveRecord::Migration
  def change
  	add_column :car_owners, :service_requests_count, :integer, :default=>0
  end
end
