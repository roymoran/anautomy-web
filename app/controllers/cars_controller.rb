class CarsController < ApplicationController
	def create
		@car = Car.new(car_params)
		@car.car_owner_id = session[:car_owner_id]
		respond_to do |format|
			if @car.save
				format.json {render json: @car.id, status: :created} # returning car id for updating form on user dashboard
			else
				head :bad_request
			end
		end
	end

	def update
		@car = Car.find(params[:id])
		#respond_to do |format|
			# update car if validated and if car belongs to current user 
			if  session[:car_owner_id] == @car.car_owner_id
				@car.update_attributes(car_params)
				head :ok
			else
				head :bad_request
			end
		#end
		# TODO - update car owner car mileage from user dashboard
		# Validate that car belongs to current user before updating
	end

	private
		def car_params
			params.require(:car).permit(:car_make_id, :car_model_id, :car_year_id, :car_option_id, :repair_submission_id, :car_owner_id, :current_mileage, :edmunds_modelyearid)
		end

	end
