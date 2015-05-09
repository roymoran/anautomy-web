class SubscribersController < ApplicationController
	def show
		@subscriber = Subscriber.all
	end

	def new
		@subscriber = Subscriber.new
		
		#render plain: "test"
		#render "static_pages/home"
	end

	def create
		@subscriber = Subscriber.new(subscriber_params)  
		if @subscriber.save 
		SubscriberMailer.new_subscriber_email(@subscriber).deliver_now
		redirect_to '/anautomy/thankyouforsubscribing#how' 
		else
			redirect_to url_for(:controller => :anautomy, :action => :welcome)
		end
	end

	private

    def subscriber_params
      params.require(:subscriber).permit(:email, :zip)
    end
    # Before filters


end
