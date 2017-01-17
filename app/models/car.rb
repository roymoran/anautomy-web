class Car < ActiveRecord::Base
	belongs_to :repair_submission
	#Model does not implement Car.car_make or Car.car_model since
	#both car_make and car_model are static lookup tables
	has_one :car_make
	has_one :car_model
	has_one :car_year
	has_one :car_option
	#will later belong_to user
end
