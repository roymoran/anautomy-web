class SubscriberMailer < ApplicationMailer

  def new_subscriber_email(subscriber)
	@subscriber = subscriber
    mail to: subscriber.email, subject: "Welcome to Anautomy! Stay Tuned for our Early Launch"
  end

  def repair_submission_email(repairSubmitter)
  	@repairSubmitter = repairSubmitter
  	mail to: repairSubmitter.email, subject: "You're our new favorite."
  end
end