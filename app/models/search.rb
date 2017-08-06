class Search
	include ActiveModel::Model
	# search added as non-activerecord model, consider saving search
	# data for future implementation
	attr_accessor :car_make_id, :car_model_id, :car_year_id, :location, :repair_category, :repair_name
	attr_accessor :search_street_number, :search_route, :search_locality, :search_administrative_area_level_1, :search_postal_code, :search_country


end
