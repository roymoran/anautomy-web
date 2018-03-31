class CarOwnersController < ApplicationController
  before_action :logged_in_car_owner, only: [:edit, :update, :show]
  before_action :correct_car_owner,   only: [:edit, :update, :show]

	def new
		@car_owner = CarOwner.new
	end

	def show
		@car_owner = CarOwner.find(params[:id])
    @service_requests = @car_owner.service_requests
    @car = Car.new
    if @car_owner.cars_count > 0
      @first_car_name = first_car(@car_owner)
      @first_car_id = @car_owner.cars[0].id
      @first_car_mileage = @car_owner.cars[0].current_mileage
      @first_car_modelyearid = @car_owner.cars[0].edmunds_modelyearid
      @car_image = @car_owner.cars[0].car_image
    end
  end
  	
  def create
    Stripe.api_key = Rails.application.secrets.stripe_secret_api_key
    @car_owner = CarOwner.new(car_owner_params)

  	if @car_owner.save
  		# Handle a successful save.
      customer = Stripe::Customer.create(
        :email => @car_owner.email
      )
      @car_owner.update_attribute(:stripe_customer_id, customer.id)
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
    Stripe.api_key = Rails.application.secrets.stripe_secret_api_key
    @car_owner = CarOwner.find(params[:id])
    @stripe_customer = Stripe::Customer.retrieve(@car_owner.stripe_customer_id)
    @payment_methods = @stripe_customer.sources.data
    
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

  # API call for Google car image search
  def car_image
    api_key = Rails.application.secrets.google_api_key
    search_engine_id = '013470965993787016560:g1ao58vq9k0'
    search_type = 'image'
    img_size = 'large'
    num_results = "1"
    year = params[:car_year]
    make = URI.encode(params[:car_make])
    model = URI.encode(params[:car_model])
    uri = URI('https://www.googleapis.com/customsearch/v1?cx='+search_engine_id+'&q='+year+'+'+make+'+'+model+'&imgSize='+img_size+'&searchType='+search_type+'&num='+num_results+'&key='+api_key)
    res = Net::HTTP.get_response(uri)
    #json_o = JSON.parse(res.body)
    #return image = json_o["items"][0]["link"]
    respond_to do |format|
      format.json { render :json => res.body}
    end

  end


	private

		def car_owner_params
			params.require(:car_owner).permit(:name, :email, :password, :password_confirmation, :phone_number)
		end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_car_owner
      unless logged_in?
        flash[:danger] = 'Login first please.'
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_car_owner
      @car_owner = CarOwner.find(params[:id])
      redirect_to(root_url) unless current_car_owner?(@car_owner)
    end

    def first_car(car_owner)
      @year = CarYear.find(car_owner.cars[0].car_year_id).year
      @make = CarMake.find(car_owner.cars[0].car_make_id).name
      @model = CarModel.find(car_owner.cars[0].car_model_id).name
      return @year.to_s + ' ' + @make + ' ' + @model
    end

    def default_car 
      # to be implented to allow user to choose default car
    end

end
