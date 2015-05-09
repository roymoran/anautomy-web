class RepairSubmissionsController < ApplicationController
	def show
		@repairSubmission = RepairSubmission.all
	end

	def new
		@repairSubmission = RepairSubmission.new
	end

	def create
		@repairSubmission = RepairSubmission.new(repairSubmission_params)  
		@repairSubmission.save 
		redirect_to :back
	end

	private

    def repairSubmission_params
      params.require(:repair_submission).permit(:name, :zip, :email, :vehicleYear, :vehicleMake, :vehicleModel, :vehicleTrim, :vehicleMileage, :repairDescription, :partsCost, :laborCost, :shopName, :shopCityState, :review)
    end

end
