class Shop < ActiveRecord::Base
	has_many :repair_submissions, inverse_of: :shop
end
