class ChargesController < ApplicationController

def new
    @sr = ServiceRequest.find(params[:id])
    auth_token = params[:t]
    if @sr.auth_token != auth_token
        flash[:warning] = "If you would like to make changes to your service request please email team@innvoy.com."
        return redirect_to root_url
    end

    if !@sr.amount_charged # avoid double charging for single service request
        Stripe.api_key = Rails.application.secrets.stripe_secret_api_key
        @car_owner = CarOwner.find(@sr.car_owner_id)
        @amount = @sr.actual_amount + service_fee_cents
        
        begin
        charge = Stripe::Charge.create(
            :customer    => @car_owner.stripe_customer_id,
            :amount      => @amount,
            :description => 'Repair ('+amount_to_usd(@sr.actual_amount)+') and Service Fee ('+service_fee_usd+')',
            :currency    => 'usd', 
            :receipt_email => @car_owner.email
        )
        rescue Stripe::CardError => e
            flash[:warning] = e.message
            return redirect_to edit_service_request_path(params[:id], t: @sr.auth_token)
        end

        flash[:success] = "Service request amount has been charged."
        @sr.update_attribute(:amount_charged, true)
        @sr.update_attribute(:status, 'Complete')
        redirect_to edit_service_request_path(params[:id], t: @sr.auth_token)
    else
        @sr.update_attribute(:status, 'Complete')
        flash[:warning] = "Service request amount cannot be charged more than once."
        redirect_to edit_service_request_path(params[:id], t: @sr.auth_token)
    end
end

end

