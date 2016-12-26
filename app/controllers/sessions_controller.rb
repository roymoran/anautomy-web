class SessionsController < ApplicationController
  def new
  end

  def create
  	@car_owner = CarOwner.find_by(email: params[:session][:email].downcase)
    if @car_owner && @car_owner.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in @car_owner
      redirect_to @car_owner
    else
      # Create an error message.
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
  
  def destroy
  	log_out
    redirect_to root_url
  end
end
