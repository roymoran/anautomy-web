class ServiceRequestMailer < ApplicationMailer

  def service_request_complete(service_request)
    @sr = service_request
    @car_owner = CarOwner.find(@sr.car_owner_id)
    mail to: @car_owner.email, subject: "We completed your service request!"
  end

end
