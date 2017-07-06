class Search
	include ActiveModel::Model
	# search added as non-activerecord model, consider saving search
	# data for future implementation
	attr_accessor :car_make_id, :car_model_id, :car_year_id, :location, :repair_category, :repair_name

end
