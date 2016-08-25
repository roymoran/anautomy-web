class Car < ActiveRecord::Base
	belongs_to :repair_submission
	has_one :car_make
	has_one :car_model
	#will later belong_to user
	#might add has_one :car_year? 
end
