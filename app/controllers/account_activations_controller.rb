class AccountActivationsController < ApplicationController

	def edit
    car_owner = CarOwner.find_by(email: params[:email])
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

end
