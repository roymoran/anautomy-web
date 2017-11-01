class RemoveDriverColumnsFromServiceRequest < ActiveRecord::Migration
  def change
  	remove_column :service_requests, :assigned_driver_name
  	remove_column :service_requests, :assigned_driver_number
  	remove_column :service_requests, :assigned_driver_image
  	remove_column :service_requests, :assigned_driver_info
  end
end
