module ServiceRequestsHelper

  def quote_to_usd(amount)
    return '$'+(amount/100.00).to_s
  end
  
  def amount_to_usd(amount)
    return '$'+(amount/100.00).to_s
  end
  
  def service_fee_usd
    service_fee = get_service_fee
    return '$'+(service_fee/100).to_s
  end

  def service_fee_cents
    service_fee = get_service_fee
    return service_fee
  end

  private
  # returns service fee in cents, if changed to non-whole number please 
  # update service_fee_usd to properly display service fee in Stripe receipt
  def get_service_fee
    service_fee = 2000
    return service_fee
  end

end
