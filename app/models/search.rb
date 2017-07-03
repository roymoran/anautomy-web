class Search
	# search added as non-activerecord model, consider saving search
	# data for future implementation
	include ActiveModel::Model
	attr_accessor :car_make_id
    attr_accessor :car_model_id
    attr_accessor :car_year_id

	#attr_accessor :car, :repair, :location
end
