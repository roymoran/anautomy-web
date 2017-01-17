class CarOption < ActiveRecord::Base
	belongs_to :car_model
	belongs_to :car
end
