class AddAmountChargedToServiceRequest < ActiveRecord::Migration
  def change
    	add_column :service_requests, :amount_charged, :boolean, :default => false
  end
end
