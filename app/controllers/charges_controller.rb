class ChargesController < ApplicationController

def new
    @sr = ServiceRequest.find(params[:id])
    validate_token(@sr.auth_token, params[:t])

    if !@sr.amount_charged # avoid double charging for single service request
        Stripe.api_key = Rails.application.secrets.stripe_secret_api_key
        @car_owner = CarOwner.find(@sr.car_owner_id)
        @amount = final_amount(@sr)
        
        # Note: passing amount argument as 0 to charge results in 
        # Stripe::InvalidRequestError, invalid positive integer
        begin
        charge = Stripe::Charge.create(
            :customer    => @car_owner.stripe_customer_id,
            :amount      => @amount,
            :description => 'Repair ('+amount_to_usd(@sr.actual_amount)+') plus Service Fee ('+service_fee_usd+')',
            :currency    => 'usd', 
            :receipt_email => @car_owner.email
        )
        rescue Stripe::CardError => e
            flash[:warning] = e.message
            return redirect_to edit_service_request_path(params[:id], t: @sr.auth_token)
        rescue Stripe::InvalidRequestError => e
            flash[:warning] = e.message
            return redirect_to edit_service_request_path(params[:id], t: @sr.auth_token)
        end

        adjust_funds_available(@sr)
        @sr.service_request_complete_email
        flash[:success] = "Service request amount has been charged."
        @sr.update_attributes(amount_charged: true, status: 'Complete')
        redirect_to edit_service_request_path(params[:id], t: @sr.auth_token)
    else
        @sr.update_attribute(:status, 'Complete')
        flash[:warning] = "Service request amount cannot be charged more than once."
        redirect_to edit_service_request_path(params[:id], t: @sr.auth_token)
    end
end

  private

    def final_amount(service_request)
      coupon = service_request.coupon_code.nil? ? nil : CouponCode.find_by(code: service_request.coupon_code)
      if coupon.nil?
        return service_request.actual_amount + service_fee_cents
      elsif !coupon.discount_amount.nil? 
        return service_request.actual_amount + service_fee_cents - coupon.discount_amount
      else 
        return ((service_request.actual_amount + service_fee_cents) * ((100-coupon.discount_percent)/100.0)).round
      end
    end

    def discount_amount(service_request)
        coupon = service_request.coupon_code.nil? ? nil : CouponCode.find_by(code: service_request.coupon_code)
        if coupon.nil?
          return 0
        elsif !coupon.discount_amount.nil? 
          return coupon.discount_amount
        else 
          return ((service_request.actual_amount + service_fee_cents) * (coupon.discount_percent/100.0)).round
        end
    end

    def adjust_funds_available(service_request)
      @coupon_funds = CouponFund.first
      @discount_amount = discount_amount(service_request)
      @coupon_funds.update_attributes(remaining_amount: @coupon_funds.remaining_amount-@discount_amount, spent_amount: @coupon_funds.spent_amount+@discount_amount)  
    end
end