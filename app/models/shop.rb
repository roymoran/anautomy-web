class Shop < ActiveRecord::Base
	has_many :repair_submissions, inverse_of: :shop
	has_many :shop_ratings, inverse_of: :shop
end
