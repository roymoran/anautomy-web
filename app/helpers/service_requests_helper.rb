module ServiceRequestsHelper

  def amount_to_usd(amount_in_cents)
    return '$'+format("%.2f", (amount_in_cents/100.0))
  end
  
  def service_fee_usd
    service_fee = get_service_fee
    return '$' + format("%.2f", (service_fee/100.0)) 
  end

  def service_fee_cents
    service_fee = get_service_fee
    return service_fee
  end

  def validate_token(expected_token, params_token)
    if params_token.nil? || expected_token != params_token
      flash[:warning] = 'If you would like to make changes to your scheduled
      repair please email team@innvoy.com.'
      return redirect_to root_url 
    end
  end
  
  private
  # returns service fee in cents and is the only source of truth
  # for the service fee. If updated this will update any views  
  # that display the service fee and will update the amount charged 
  # for all completed service requests
  def get_service_fee
    service_fee = 2000
    return service_fee
  end

end
