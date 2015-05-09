class SubscriberMailer < ApplicationMailer

  def new_subscriber_email(subscriber)
	@subscriber = subscriber
    mail to: subscriber.email, subject: "You're On Our List!"
  end

  def repair_submission_email(repairSubmitter)
  	@repairSubmitter = repairSubmitter
  	mail to: repairSubmitter.email, subject: "You're our new favorite."
  end
end