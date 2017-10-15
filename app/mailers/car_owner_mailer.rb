class CarOwnerMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.car_owner_mailer.account_activation.subject
  #

  def account_activation(car_owner)
    @car_owner = car_owner
    mail to: car_owner.email, subject: "Account activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.car_owner_mailer.password_reset.subject
  #
  def password_reset(car_owner)
    @car_owner = car_owner
    mail to: car_owner.email, subject: "Password reset"
  end

  def service_request_processing(car_owner)
    @car_owner = car_owner
    mail to: car_owner.email, subject: "Just a heads up, we're processing your request!"
  end

end
