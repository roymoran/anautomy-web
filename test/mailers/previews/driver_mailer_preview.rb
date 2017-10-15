# Preview all emails at http://localhost:3000/rails/mailers/driver_mailer
class DriverMailerPreview < ActionMailer::Preview
	def service_created(service_request)
		@service_request = ServiceRequest.first
		@car_owner = CarOwner.first
		@car = Car.first
		@year = CarYear.find(@car.car_year_id).year
        @make = CarMake.find(@car.car_make_id).name
        @model = CarModel.find(@car.car_model_id).name
        @car_details = @year.to_s + ' ' + @make + ' ' + @model
        DriverMailer.service_created(service_created)
	end
end
