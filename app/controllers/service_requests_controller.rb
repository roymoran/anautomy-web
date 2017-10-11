class ServiceRequestsController < ApplicationController
  before_action :payment_method_present, only: [:new]

  def new
  	@google_api_key = Rails.application.secrets.google_api_key
  	@sr = ServiceRequest.new
  	@sr.car_owner_id = session[:car_owner_id]
  	@cars_list = car_list_by_name(CarOwner.find(session[:car_owner_id]).cars)
  end

  def create
  	@sr = ServiceRequest.new(service_request_params)
  	@sr.status = 'Created'
  	# email service created
  	if @sr.save
  		# Handle a successful save.
      #@sr.send_activation_email
      flash[:info] = "Your service request was created."
      redirect_to @sr #redirect to root      

  	else
      render 'new'
    end
  end

  def update
  end

  def show
    @sr = ServiceRequest.find(params[:id])
    if @sr.car_owner_id != session[:car_owner_id]
      flash[:info] = "You don't have access to this service request"
      redirect_to action: 'new'
    end
  end

  private
  	def service_request_params
  		params.require(:service_request).permit(:car_owner_id, :car_id, :repair_name, :pickup_location, :status)
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
