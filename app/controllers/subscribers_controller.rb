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
		respond_to do |format|
			#add fallback to html
		format.js # actually means: if the client ask for js -> return file.js
		
		SubscriberMailer.new_subscriber_email(@subscriber).deliver_now
		
	    end
		
		else
			respond_to do |format|
				#add fallback to html
			format.js
			end
		end
	end

	private

    def subscriber_params
      params.require(:subscriber).permit(:email, :zip)
    end
    # Before filters


end
