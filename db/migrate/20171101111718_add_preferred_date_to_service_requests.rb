class AddPreferredDateToServiceRequests < ActiveRecord::Migration
  def change
  	add_column :service_requests, :preferred_time, :string
  	add_column :service_requests, :preferred_day, :string
  end
end
