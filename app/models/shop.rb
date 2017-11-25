class Shop < ActiveRecord::Base
	has_many :shop_users, inverse_of: :shop
	has_many :repair_submissions, inverse_of: :shop
	has_many :shop_ratings, inverse_of: :shop
	has_many :service_requests, inverse_of: :shop
	validates :register_id, uniqueness: true

end
