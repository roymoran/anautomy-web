class ServiceRequest < ActiveRecord::Base
  belongs_to :car_owner, inverse_of: :service_requests, counter_cache: true
  belongs_to :car, inverse_of: :service_requests
  belongs_to :driver, inverse_of: :service_requests
  belongs_to :shop, inverse_of: :service_requests
  attr_accessor :search_street_number, :search_route, :search_locality, :search_administrative_area_level_1, :search_postal_code, :search_country


  def ServiceRequest.new_token
    SecureRandom.urlsafe_base64
  end

  # Sends request processing email.
  def service_request_complete_email
    ServiceRequestMailer.service_request_complete(self).deliver_now
  end


end
