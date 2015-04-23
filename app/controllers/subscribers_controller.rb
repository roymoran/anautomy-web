class SubscribersController < ApplicationController

	def new
		@subscriber = Subscriber.new
		#render plain: "test"
		#render "static_pages/home"
	end

	def create
		@subscriber = Subscriber.new(subscriber_params)  
		if @subscriber.save
			SubscriberMailer.new_subscriber_email(@subscriber).deliver_now
		flash[:success] = "You will be hearing from us soon...very soon."
		redirect_to :back
		else
			render 'new'
		end
	end



	private

    def subscriber_params
      params.require(:subscriber).permit(:email, :zip)
    end
    # Before filters


end
