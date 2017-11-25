class AddAuthTokenToServiceRequest < ActiveRecord::Migration
  def change
    add_column :service_requests, :auth_token, :string
  end
end
