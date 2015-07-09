class RepairSubmissionsController < ApplicationController
	def show
		@repairSubmission = RepairSubmission.all
	end

	def new
		@repairSubmission = RepairSubmission.new
	end

	def create
		@repairSubmission = RepairSubmission.new(repairSubmission_params)  
		if @repairSubmission.save 
		#SubscriberMailer.repair_submission_email(@repairSubmission).deliver_now
		
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

	private

    def repairSubmission_params
      params.require(:repair_submission).permit(:name, :zip, :email, :vehicle_year, :vehicle_make, :vehicle_model, :vehicle_trim, :vehicle_mileage, :repair_description, :parts_cost, :labor_cost, :shop_name, :shop_city_state, :review)
    end

end
