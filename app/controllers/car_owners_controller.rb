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
  		log_in @car_owner
      remember @car_owner
  		redirect_to @car_owner #redirect to root
  	else
      render 'new'
    end
	end

  def edit
    @car_owner = CarOwner.find(params[:id])
  end

  def update
    @car_owner = CarOwner.find(params[:id])
    if @car_owner.update_attributes(car_owner_params)
      # Handle a successful update.
      flash[:success] = "Account Updated"
      redirect_to @car_owner
    else
      render 'edit'
    end
  end

	private

		def car_owner_params
			params.require(:car_owner).permit(:name, :email, :password, :password_confirmation)
		end
end
