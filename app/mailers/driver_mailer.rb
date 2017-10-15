class DriverMailer < ApplicationMailer

	def service_created(service_request)
		@service_request = service_request
		@car_owner = CarOwner.find(@service_request.car_owner_id)
		@car = Car.find(@service_request.car)
		@year = CarYear.find(@car.car_year_id).year
        @make = CarMake.find(@car.car_make_id).name
        @model = CarModel.find(@car.car_model_id).name
        @car_details = @year.to_s + ' ' + @make + ' ' + @model
		mail to: 'roy@innvoy.com', subject: "Service Created"
	end

	def service_assigned(driver, service_request)
    	@driver = driver
    	@service_request = service_request
    	mail to: driver.email, subject: "Service Assigned"
  	end

end
