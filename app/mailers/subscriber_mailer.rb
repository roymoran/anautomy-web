class SubscriberMailer < ApplicationMailer

def new_subscriber_email(subscriber)
	@subscriber = subscriber
    mail to: subscriber.email, subject: "You're On Our List!"
  end
  
end