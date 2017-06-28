class Search
	# search added as non-activerecord model, consider saving search
	# data for future implementation
	include ActiveModel::Model
	attr_accessor :car, :repair, :location
end
