class AccountActivationsController < ApplicationController

	def edit
    car_owner = CarOwner.find_by(email: params[:email])
    	if !car_owner.nil?
    		if car_owner && !car_owner.activated? && car_owner.authenticated?(:activation, params[:id])
      			car_owner.activate
      			log_in car_owner
      			flash[:success] = "Account activated!"
      			redirect_to car_owner
    		else
      			flash[:danger] = "Invalid activation link"
      			redirect_to root_url
    		end
		end
	shop_user = ShopUser.find_by(email: params[:email])
		if !shop_user.nil?
    		if shop_user && !shop_user.activated? && shop_user.authenticated?(:activation, params[:id])
      			shop_user.activate
      			log_in shop_user
      			flash[:success] = "Account activated!"
      			redirect_to shop_user
    		else
      			flash[:danger] = "Invalid activation link"
      			redirect_to root_url
    		end
		end
  	end

end
