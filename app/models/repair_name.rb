class RepairName < ActiveRecord::Base
	# opting out of adding repair_id field to RepairName table 
	# since both RepairCategory and RepairName are fixed db tables. No need
	# to accesses RepairCategory or RepairName from Repair
	belongs_to :repair 
	belongs_to :repair_category

	#Note on expanding this model to include several repair names that are each mapped to
	#a specific car make, model, and year. Right now all cars share these common list of repairs
	#in near future we would like each repair to have an associated car_make_id and car_model_id
	#potentially car_year_id. This allows us to populate view to show specific repairs based on 
	#the car chosen by the user
	#belongs_to :car_make
	#belongs_to :car_model
	#belongs_to :car_year (yet to be implmented)
end
