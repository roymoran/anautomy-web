class PasswordResetsController < ApplicationController
	before_action :get_car_owner,   only: [:edit, :update]
  	before_action :valid_car_owner, only: [:edit, :update]

  def new

  end

  def create
    @car_owner = CarOwner.find_by(email: params[:password_reset][:email].downcase)
    if @car_owner
      @car_owner.create_reset_digest
      @car_owner.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      @car_owner = CarOwner.new #temporary hack. Since @car_owner must be initialized for header signup form
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:car_owner][:password].empty?                  # Making sure pass fields arent blank
      @car_owner.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @car_owner.update_attributes(user_params)          # Password reset succesfully
      log_in @car_owner
      flash[:success] = "Password has been reset."
      redirect_to @car_owner
    else
      render 'edit'                                     # Invalid password
    end
  end

  private

  	def user_params
      params.require(:car_owner).permit(:password, :password_confirmation)
    end

    # Before filters

    def get_car_owner
      @car_owner = CarOwner.find_by(email: params[:email])
    end

    # Confirms a valid car_owner.
    def valid_car_owner
      unless (@car_owner && @car_owner.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    # Checks expiration of reset token.
    def check_expiration
      if @car_owner.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end

end
