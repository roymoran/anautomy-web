class Driver < ActiveRecord::Base
  has_many :service_requests, inverse_of: :driver

  def send_service_assigned_email
    DriverMailer.service_assigned(self).deliver_now
  end

  def send_service_created_email(service_request)
    DriverMailer.service_created(service_request).deliver_now
  end

end
