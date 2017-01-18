module SessionsHelper

# Logs in the given user.
  def log_in(car_owner)
    session[:car_owner_id] = car_owner.id
  end

  # Returns true if the given user is the current user.
  def current_car_owner?(car_owner)
    car_owner == current_car_owner
  end

  # Returns the current logged-in user (if any).
  def current_car_owner
    if (car_owner_id = session[:car_owner_id])
      @current_car_owner ||= CarOwner.find_by(id: car_owner_id)
    elsif (car_owner_id = cookies.signed[:car_owner_id])
      car_owner = CarOwner.find_by(id: car_owner_id)
      if car_owner && car_owner.authenticated?(:remember, cookies[:remember_token])
        log_in car_owner
        @current_car_owner = car_owner
      end
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_car_owner.nil?
  end

  # Logs out the current user.
  def log_out
    forget(current_car_owner)
    session.delete(:car_owner_id)
    @current_car_owner = nil
  end

  # Remembers a user in a persistent session.
  def remember(car_owner)
    car_owner.remember
    cookies.permanent.signed[:car_owner_id] = car_owner.id
    cookies.permanent[:remember_token] = car_owner.remember_token
  end

  # Forgets a persistent session.
  def forget(car_owner)
    car_owner.forget
    cookies.delete(:car_owner_id)
    cookies.delete(:remember_token)
  end



# Logs in the given user.
  def shop_user_log_in(shop_user)
    session[:shop_user_id] = shop_user.id
  end

  # Returns true if the given user is the current user.
  def current_shop_user?(shop_user)
    shop_user == current_shop_user
  end

 # Returns the current logged-in user (if any).
  def current_shop_user
    if (shop_user_id = session[:shop_user_id])
      @current_shop_user ||= ShopUser.find_by(id: shop_user_id)
    elsif (shop_user_id = cookies.signed[:shop_user_id])
      shop_user = ShopUser.find_by(id: shop_user_id)
      if shop_user && shop_user.authenticated?(:remember, cookies[:remember_token])
        shop_user_log_in shop_user
        @current_shop_user = shop_user
      end
    end
  end

  # Returns true if the shop_user is logged in, false otherwise.
  def shop_user_logged_in?
    !current_shop_user.nil?
  end

   # Logs out the current shop user.
  def shop_user_log_out
    forget(current_shop_user)
    session.delete(:shop_user_id)
    @current_shop_user = nil
  end

  # Remembers a user in a persistent session.
  def shop_user_remember(shop_user)
    shop_user.remember
    cookies.permanent.signed[:shop_user_id] = shop_user.id
    cookies.permanent[:remember_token] = shop_user.remember_token
  end

  # Forgets a persistent session.
  def shop_user_forget(shop_user)
    shop_user.forget
    cookies.delete(:shop_user_id)
    cookies.delete(:remember_token)
  end

end
