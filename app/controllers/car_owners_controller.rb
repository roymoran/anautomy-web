class CarOwnersController < ApplicationController
	def new
		@car_owner = CarOwner.new
	end

	def show
		@car_owner = CarOwner.find(params[:id])
  	end
  	
  	def create
  		@car_owner = CarOwner.new(car_owner_params)
  		if @car_owner.save
  		# Handle a successful save.
  			
  			redirect_to @car_owner #redirect to root
  		else
      		render 'new'
    	end
	end

	private

		def car_owner_params
			params.require(:car_owner).permit(:name, :email, :password, :password_confirmation)
		end
end
