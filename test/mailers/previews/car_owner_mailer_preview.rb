# Preview all emails at http://localhost:3000/rails/mailers/car_owner_mailer
class CarOwnerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/car_owner_mailer/account_activation
  def account_activation
    car_owner = CarOwner.first
    car_owner.activation_token = CarOwner.new_token
    CarOwnerMailer.account_activation(car_owner)
  end
  # Preview this email at http://localhost:3000/rails/mailers/car_owner_mailer/password_reset
  def password_reset
    car_owner = CarOwner.first
    car_owner.reset_token = CarOwner.new_token
    CarOwnerMailer.password_reset(car_owner)
  end
end
