# Preview all emails at http://localhost:3000/rails/mailers/subscriber_mailer
class SubscriberMailerPreview < ActionMailer::Preview

# Preview this email at
# http://localhost:3000/rails/mailers/subscriber_mailer/new_subscriber_email
  def new_subscriber_email
    subscriber = Subscriber.first
    SubscriberMailer.new_subscriber_email(subscriber)
end

end