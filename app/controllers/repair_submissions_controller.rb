class RepairSubmissionsController < ApplicationController

	def show
		@repairSubmission = RepairSubmission.all
	end

	def new
		@repair_category = RepairCategory.all
		@shop = Shop.find(params[:shop_id])
		@repairSubmission = RepairSubmission.new
		@repairSubmission.shop_id = @shop.id
	end

	def create
		@repairSubmission = RepairSubmission.new(repairSubmission_params)
		if @repairSubmission.save 
		# @repairSubmission.create_car is used to create and save the associated car to
		# the repair submission. Params passed by new action is passed as field values  
		@repairSubmission.create_car(car_make_id: @repairSubmission.car_make, car_model_id: @repairSubmission.car_model)
		#@repairSubmission.create_repair(repair_category_id: @repairSubmission.repair_category, repair_name_id: @repairSubmission.repair_name)

		SubscriberMailer.repair_submission_email(@repairSubmission).deliver_now
		
		respond_to do |format|
			#add fallback to html
		format.js # actually means: if the client ask for js -> return file.js
	    end
		
		else
			respond_to do |format|
				#add fallback to html
			format.js
			end
		end

	end

	def search
		
	end

	private

    def repairSubmission_params
      params.require(:repair_submission).permit(:email, :vehicle_year, :vehicle_trim, :vehicle_mileage, :repair_description, :parts_cost, :labor_cost, :total_cost, :review, :car_make, :car_model, :shop_id, :repair_date, :repair_name, :repair_category)
    end

end
