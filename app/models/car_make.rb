class CarMake < ActiveRecord::Base
	# opting out of adding car_id field to CarModel table 
	# since both CarModel and CarMake are fixed db tables. No need
	# to access car from CarMake/CarModel
	belongs_to :car
	has_many :car_models
end
