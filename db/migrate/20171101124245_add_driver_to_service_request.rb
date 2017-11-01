class AddDriverToServiceRequest < ActiveRecord::Migration
  def change
  	add_reference :service_requests, :driver, index: true
    add_foreign_key :service_requests, :drivers
  end
end
