class ServiceRequest < ActiveRecord::Base
  belongs_to :car_owner, inverse_of: :service_requests
  belongs_to :car, inverse_of: :service_requests
  belongs_to :driver, inverse_of: :service_requests
  attr_accessor :search_street_number, :search_route, :search_locality, :search_administrative_area_level_1, :search_postal_code, :search_country


end
