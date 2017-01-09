class SessionsController < ApplicationController
  def new
  end

  def create
  	@car_owner = CarOwner.find_by(email: params[:session][:email].downcase)
    if @car_owner && @car_owner.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in @car_owner
      remember @car_owner
      redirect_to @car_owner
      
      #if user.activated?
        #log_in user
        #params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        #redirect_back_or user
      #else
        #message  = "Account not activated. "
        #message += "Check your email for the activation link."
        #flash[:warning] = message
        #redirect_to root_url
      #end

    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
  
  def destroy
  	log_out if logged_in?
    redirect_to root_url
  end
end
