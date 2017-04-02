class CarOwnersController < ApplicationController
  before_action :logged_in_car_owner, only: [:edit, :update, :show]
  before_action :correct_car_owner,   only: [:edit, :update, :show]

	def new
		@car_owner = CarOwner.new
	end

	def show
		@car_owner = CarOwner.find(params[:id])
    @car = Car.new
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

  # Actions for Edmunds API calls
  def model_year_id
    year = params[:car_year]
    make = URI.encode(params[:car_make])
    model = URI.encode(params[:car_model])
    api_key = Rails.application.secrets.edmunds_api_key
    uri = URI('https://api.edmunds.com/api/vehicle/v2/'+make+'/'+model+'/'+year+'?fmt=json&api_key='+api_key)
    res = Net::HTTP.get_response(uri)

    respond_to do |format|
      format.json { render :json => res.body}
    end

  end

  def maintenance_schedule
    api_key = Rails.application.secrets.edmunds_api_key
    modelyearid = params[:model_year_id]
    uri = URI('https://api.edmunds.com/v1/api/maintenance/actionrepository/findbymodelyearid?modelyearid='+modelyearid+'&fmt=json&api_key=' + api_key)
    res = Net::HTTP.get_response(uri)

    respond_to do |format|
      format.json { render :json => res.body}
    end
  end

  def tco_used
    api_key = Rails.application.secrets.edmunds_api_key
    styleid = params[:style_id]
    zipcode = params[:zipcode]
    uri = URI('https://api.edmunds.com/v1/api/tco/usedtruecosttoownbystyleidandzip/'+styleid+'/'+zipcode+'?fmt=json&api_key=' + api_key)
    res = Net::HTTP.get_response(uri)

    respond_to do |format|
      format.json { render :json => res.body}
    end
  end

  def tco_used_detailed
    api_key = Rails.application.secrets.edmunds_api_key
    styleid = params[:style_id]
    zipcode = params[:zipcode]
    state_code = 'il' # should be pulled from api based on zipcode
    uri = URI('https://api.edmunds.com/api/tco/v1/details/allusedtcobystyleidzipandstate/'+styleid+'/'+zipcode+'/'+state_code+'?fmt=json&api_key=' + api_key)
    res = Net::HTTP.get_response(uri)

    respond_to do |format|
      format.json { render :json => res.body}
    end
  end

  def tmv_typical
    api_key = Rails.application.secrets.edmunds_api_key
    styleid = params[:style_id]
    zipcode = params[:zipcode]
    uri = URI('https://api.edmunds.com/v1/api/tmv/tmvservice/calculatetypicallyequippedusedtmv?styleid='+styleid+'&zip='+zipcode+'&fmt=json&api_key=' + api_key)
    res = Net::HTTP.get_response(uri)

    respond_to do |format|
      format.json { render :json => res.body}
    end

  end

  def tmv_detailed
    api_key = Rails.application.secrets.edmunds_api_key
    styleid = params[:style_id]
    zipcode = params[:zipcode]
    mileage = params[:mileage]
    condition = params[:condition]
    uri = URI('https://api.edmunds.com/v1/api/tmv/tmvservice/calculateusedtmv?styleid='+styleid+'&condition='+condition+'&mileage='+mileage+'&zip='+zipcode+'&fmt=json&api_key=' + api_key)
    res = Net::HTTP.get_response(uri)

    respond_to do |format|
      format.json { render :json => res.body}
    end

  end

  def recalls
    api_key = Rails.application.secrets.edmunds_api_key
    modelyearid = params[:model_year_id]
    uri = URI('https://api.edmunds.com/v1/api/maintenance/recallrepository/findbymodelyearid?modelyearid='+modelyearid+'&fmt=json&api_key=' + api_key)
    res = Net::HTTP.get_response(uri)

    respond_to do |format|
      format.json { render :json => res.body}
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
