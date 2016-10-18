class ShopRating < ActiveRecord::Base
	belongs_to :shop, inverse_of: :shop_ratings, counter_cache: true
	belongs_to :repair_submission
end
