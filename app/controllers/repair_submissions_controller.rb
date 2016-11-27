class RepairSubmissionsController < ApplicationController
	before_filter :set_shop, only: [:new, :create]
	def show
		@repairSubmission = RepairSubmission.all
	end

	def new
		@repair_category = RepairCategory.all.offset(1)
		#@shop = Shop.find(params[:shop_id])
		@repairSubmission = RepairSubmission.new
		@repairSubmission.shop_id = @shop.id
	end

	def create
		@repairSubmission = RepairSubmission.new(repairSubmission_params)  
		if @repairSubmission.save 
		respond_to do |format|
			#add fallback to html
		format.js # actually means: if the client ask for js -> return file.js
	    end
		# @repairSubmission.create_car is used to create and save the associated car to
		# the repair submission. Params passed by new action is passed as field values
		@repairSubmission.create_car(car_make_id: @repairSubmission.car_make, car_model_id: @repairSubmission.car_model, car_year_id: @repairSubmission.car_year)
		#@repairSubmission.create_repair(repair_category_id: @repairSubmission.repair_category, repair_name_id: @repairSubmission.repair_name, repair_name_custom: @repairSubmission.repair_name_custom)
			if (@repairSubmission.repair_category == "1" and @repairSubmission.repair_name == "1")
				@repairSubmission.create_repair(repair_category_id: @repairSubmission.repair_category, repair_name_id: @repairSubmission.repair_name, repair_name_custom: @repairSubmission.repair_name_custom)
			else
				@repairSubmission.create_repair(repair_category_id: @repairSubmission.repair_category, repair_name_id: @repairSubmission.repair_name)
			end
		@repairSubmission.create_shop_rating(cost_rating: params[:cost_rating], quality_rating: params[:quality_rating], quickness_rating: params[:quickness_rating])
		@shop.shop_ratings.create(cost_rating: params[:cost_rating], quality_rating: params[:quality_rating], quickness_rating: params[:quickness_rating])
		
		# Email user
		SubscriberMailer.repair_submission_email(@repairSubmission).deliver_now

		else
			respond_to do |format|
				#add fallback to html
			format.js
			end
		end

	end

	def search
		
	end

	def set_shop
    	@shop = Shop.find(params[:shop_id])
    end

    def fetch_car_makes
    	@makes = CarMake.where(params[:car_year] + " = TRUE").order(name: :asc)
    	respond_to do |format|
    		format.json { render :json => @makes.as_json(:only => [:id, :name]) }
    	end
    end

    def fetch_car_models
    	@models = CarModel.where(params[:car_year] + " = TRUE AND car_make_id = ?", params[:car_make_id]).order(name: :asc)
    	respond_to do |format|
    		format.json { render :json => @models.as_json(:only => [:id, :name]) }
    	end
    end

	private

    def repairSubmission_params
      params.require(:repair_submission).permit(:email, :vehicle_trim, :vehicle_mileage, :repair_description, :parts_cost, :labor_cost, :total_cost, :review, :car_make, :car_model, :car_year, :shop_id, :repair_date, :repair_name, :repair_category, :repair_name_custom)
    end

end
