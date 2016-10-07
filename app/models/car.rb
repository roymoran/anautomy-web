class Car < ActiveRecord::Base
	belongs_to :repair_submission
	#Model does not implement Car.car_make or Car.car_model since
	#both car_make and car_model are static lookup tables
	has_one :car_make
	has_one :car_model
	#will later belong_to user
	#might add has_one :car_year? 
end
