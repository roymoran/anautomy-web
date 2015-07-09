class RepairSubmission < ActiveRecord::Base
	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, length: {maximum: 50}
	validates :zip, presence: true, length: {maximum: 10} 
	validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX} #removed email unqiueness for submission
	
	validates :vehicle_year, presence: true, length: {maximum: 255}
	validates :vehicle_make, presence: true, length: {maximum: 5}
	validates :vehicle_model, presence: true, length: {maximum: 50}
	validates :vehicle_trim, presence: true, length: {maximum: 50}

	validates :repair_description, presence: true
	validates :parts_cost, presence: true
	validates :labor_cost, presence: true

	validates :shop_name, presence: true
	validates :shop_city_state, presence: true, length: {maximum: 50}
end
