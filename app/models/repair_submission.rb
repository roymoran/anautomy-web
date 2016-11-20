class RepairSubmission < ActiveRecord::Base
	# attr_accessor added for car_make and car_model (virtual attribute) to save
	# value of the car_make and car_model option value. This is then sent as a paramter
	# when creating the car in the create action
	attr_accessor :car_make
    attr_accessor :car_model
    attr_accessor :car_year

    attr_accessor :repair_category
    attr_accessor :repair_name

	belongs_to :shop, inverse_of: :repair_submissions, counter_cache: true
	has_one :car
	has_one :repair
	has_one :shop_rating

	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX} #removed email unqiueness for submission
	
	validates :vehicle_year, presence: true, length: {maximum: 255}
	#validates :vehicle_trim, presence: true, length: {maximum: 50}
	#validates :vehicle_mileage, presence: true

	validates :car_make, presence: true
	validates :car_model, presence: true
	validates :repair_category, presence: true
	validates :repair_name, presence: true

	validates :parts_cost, presence: true
	validates :labor_cost, presence: true
end
