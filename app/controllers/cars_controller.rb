class CarsController < ApplicationController
	def create
		@car = Car.new(car_params)
		@car.save
	end

	private
		def car_params
			params.require(:car).permit(:car_make_id, :car_model_id, :car_year_id, :car_option_id, :repair_submission_id, :car_owner_id)
		end
end
