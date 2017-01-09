class CarOwnersController < ApplicationController
  before_action :logged_in_car_owner, only: [:edit, :update, :show]
  before_action :correct_car_owner,   only: [:edit, :update, :show]

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
      @car_owner.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      #redirect_to root_url
  		log_in @car_owner
      remember @car_owner
  		redirect_to @car_owner #redirect to root      

  	else
      render 'new'
    end
	end

  def edit
    @car_owner = CarOwner.find(params[:id])
    if !@car_owner.activated?
      message  = "Your account is not activated. "
      message += "Check your email for the activation link."
      flash.now[:warning] = message
    end
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

    # Before filters

    # Confirms a logged-in user.
    def logged_in_car_owner
      unless logged_in?
        flash[:danger] = "Login first please."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_car_owner
      @car_owner = CarOwner.find(params[:id])
      redirect_to(root_url) unless current_car_owner?(@car_owner)
    end

end
