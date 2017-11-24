class ServiceRequestsController < ApplicationController
  before_action :payment_method_present, only: [:new]
  before_action :logged_in_car_owner, only: [:edit, :update, :show]
  before_action :correct_car_owner,   only: [:edit, :update, :show]

  def new
    @repair_category = RepairCategory.all.offset(1)
  	@google_api_key = Rails.application.secrets.google_api_key
  	@sr = ServiceRequest.new
  	@sr.car_owner_id = session[:car_owner_id]
  	@cars_list = car_list_by_name(CarOwner.find(session[:car_owner_id]).cars)
  end

  def create
  	@sr = ServiceRequest.new(service_request_params)
    @sr.car_owner_id = session[:car_owner_id]
  	@sr.status = 'Created'
  	# email service created
  	if @sr.save
  		# Handle a successful save.
      #@sr.send_activation_email
      flash[:info] = "Your service request was created, and will be processed shortly."
      @driver = Driver.new
      @driver.send_service_created_email(@sr) # default notification
      # assign_driver(@sr) #placeholder for assigning driver
      @car_owner = CarOwner.find(@sr.car_owner_id)
      @car_owner.service_request_processing_email
      redirect_to @car_owner
  	else
      render 'new'
    end
  end

  def edit
    @sr = ServiceRequest.find(params[:id])
    @car = car_name(Car.find(@sr.car_id))
  end

  def update
    @sr = ServiceRequest.find(params[:id])
    @sr.status = 'Created'
    if @sr.update_attributes(service_request_params)

      # Handle a successful update.
      flash[:success] = "Service Request Updated"
      # send email 
      redirect_to edit_service_request_path(@sr)
    else
      render 'edit'
    end
  end

  def show
    @sr = ServiceRequest.find(params[:id])
    if @sr.car_owner_id != session[:car_owner_id]
      flash[:info] = "You don't have access to this service request."
      redirect_to action: 'new'
    end
  end

  def place_coordinates
    api_key = Rails.application.secrets.google_api_key
    location = URI.encode(params[:location])
    uri = URI('https://maps.googleapis.com/maps/api/geocode/json?address='+location+'&key=' + api_key)
    res = Net::HTTP.get_response(uri)
    respond_to do |format|
      format.json { render :json => res.body}
    end
  end

  private
  	def service_request_params
  		params.require(:service_request).permit(:car_owner_id, :car_id, :repair_name, :pickup_location, :status, :preferred_time, :preferred_day, :driver_id, :shop_id, :actual_amount, :quote_amount, :scheduled_at)
    end

    # Confirms a logged-in user.
    def logged_in_car_owner
      unless logged_in?
        flash[:danger] = "Login first please."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_car_owner
      @car_owner = CarOwner.find(session[:car_owner_id])
      redirect_to(root_url) unless current_car_owner?(@car_owner)
    end

    # Given the user associated cars, return nice list of
    # cars with name "YEAR MAKE MODEL" and id value
    def car_list_by_name(car_list)
		  new_car_list = Array.new
		  car_list.each do |car|
        item = Hash.new
        @year = CarYear.find(car.car_year_id).year
        @make = CarMake.find(car.car_make_id).name
        @model = CarModel.find(car.car_model_id).name
        item["car_name"] = @year.to_s + ' ' + @make + ' ' + @model
        item["id"] = car.id
        new_car_list.push(item)
		  end
      return new_car_list
    end

    def car_name(car)
      @year = CarYear.find(car.car_year_id).year
      @make = CarMake.find(car.car_make_id).name
      @model = CarModel.find(car.car_model_id).name
      return @year.to_s + ' ' + @make + ' ' + @model
    end

    # Validate if user has stripe payment source 
    # associated with their account
    def payment_method_present
      Stripe.api_key = Rails.application.secrets.stripe_secret_api_key
      @stripe_customer = Stripe::Customer.retrieve(CarOwner.find(session[:car_owner_id]).stripe_customer_id)
      @source_count = @stripe_customer.sources.data.count
      if @source_count == 0
        flash.now[:warning] = "You must have a payment method before you can create a service request. Visit your account settings to add a payment method."
      end
    end
end
