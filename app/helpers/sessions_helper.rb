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
      if car_owner && car_owner.authenticated?(cookies[:remember_token])
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

end
