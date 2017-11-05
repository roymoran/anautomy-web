class AddScheduledAtToServiceRequest < ActiveRecord::Migration
  def change
  	add_column :service_requests, :scheduled_at, :datetime
  end
end
