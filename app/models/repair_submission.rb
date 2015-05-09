class RepairSubmission < ActiveRecord::Base
	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true
	validates :zip, presence: true
	validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX} #removed email unqiueness for submission
	
	validates :vehicleYear, presence: true
	validates :vehicleMake, presence: true
	validates :vehicleModel, presence: true
	validates :vehicleTrim, presence: true
	validates :vehicleMileage, presence: true

	validates :repairDescription, presence: true
	validates :partsCost, presence: true
	validates :laborCost, presence: true

	validates :shopName, presence: true
	validates :shopCityState, presence: true
	validates :review, presence: true
end
