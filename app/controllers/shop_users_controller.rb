class ShopUsersController < ApplicationController
  layout "shop"
  before_action :logged_in_shop_user, only: [:edit, :update, :show]
  before_action :correct_shop_user,   only: [:edit, :update, :show]
  def new
  	@shop_user = ShopUser.new
  	@shop = Shop.find(params[:sid])
  	# Check to ensure registration id passed in params matches 
  	# registration id stored in database for the shop
  	if params[:rid] == @shop.register_id
  		# render registration page 
  	else 
  		# user is not authorized to view page so redirect to root
  		redirect_to root_url
  	end
  end

  def show
    @shop_user = ShopUser.find(params[:id])
  end

  def create
  	@shop_user = ShopUser.new(shop_user_params)
  	@shop = Shop.find(params[:shop_user][:shop_id])
  	#@shop_user.shop_id = params[:sid]
  	if @shop_user.save && (params[:rid] == @shop.register_id)
  		# Handle a successful save.
      @shop_user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      #redirect_to root_url
  		shop_user_log_in @shop_user
  		shop_user_remember @shop_user
  		redirect_to @shop_user #redirect to root
  	else
      render 'new'
    end
  end

  def edit
    @shop_user = ShopUser.find(params[:id])
    if !@shop_user.activated?
      message  = "Your account is not activated. "
      message += "Check your email for the activation link."
      flash.now[:warning] = message
    end
  end

  def update
    @shop_user = ShopUser.find(params[:id])
    if @shop_user.update_attributes(shop_user_params)
      # Handle a successful update.
      flash[:success] = "Account Updated"
      redirect_to @shop_user
    else
      render 'edit'
    end
  end

  private

	def shop_user_params
		params.require(:shop_user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :shop_id)
	end


  # Before filters

    # Confirms a logged-in user.
    def logged_in_shop_user
      unless shop_user_logged_in?
        flash[:danger] = "Login first please."
        redirect_to login_shop_url
      end
    end

    # Confirms the correct user.
    def correct_shop_user
      @shop_user = ShopUser.find(params[:id])
      redirect_to(root_url) unless current_shop_user?(@shop_user)
    end



end
