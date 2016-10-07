class CarModel < ActiveRecord::Base
	# opting out of adding car_id field to CarModel table 
	# since both CarModel and CarMake are fixed db tables. No need
	# to accesses car from CarMake/CarModel
	belongs_to :car
	belongs_to :car_make
end
