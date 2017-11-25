module ServiceRequestsHelper

def quote_to_usd(amount)
    return '$'+(amount/100.00).to_s
end

end
