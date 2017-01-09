class ShopUsersController < ApplicationController
  layout "shop"
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
  		log_in @shop_user
  		remember @shop_user
  		redirect_to @shop_user #redirect to root
  	else
      render 'new'
    end
  end

  private

	def shop_user_params
		params.require(:shop_user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :shop_id)
	end

end
