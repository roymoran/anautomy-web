class AddCouponCodeToServiceRequest < ActiveRecord::Migration
  def change
    add_column :service_requests, :coupon_code, :string
  end
end
