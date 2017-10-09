class PaymentMethodsController < ApplicationController
	def create
		Stripe.api_key = Rails.application.secrets.stripe_secret_api_key
		@car_owner = CarOwner.find(session[:car_owner_id])

		customer = Stripe::Customer.retrieve(@car_owner.stripe_customer_id)
		customer.sources.create(:source => params[:stripeToken])

		redirect_to edit_car_owner_path(@car_owner)
	end
end
