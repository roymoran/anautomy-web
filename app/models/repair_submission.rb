class RepairSubmission < ActiveRecord::Base
	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, length: {maximum: 50}
	validates :zip, presence: true, length: {maximum: 10} 
	validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX} #removed email unqiueness for submission
	
	validates :vehicleYear, presence: true, length: {maximum: 255}
	validates :vehicleMake, presence: true, length: {maximum: 5}
	validates :vehicleModel, presence: true, length: {maximum: 50}
	validates :vehicleTrim, presence: true, length: {maximum: 50}

	validates :repairDescription, presence: true
	validates :partsCost, presence: true
	validates :laborCost, presence: true

	validates :shopName, presence: true
	validates :shopCityState, presence: true, length: {maximum: 50}
end
