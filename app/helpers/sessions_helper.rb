module SessionsHelper

# Logs in the given user.
  def log_in(car_owner)
    session[:car_owner_id] = car_owner.id
  end

  # Returns the current logged-in user (if any).
  def current_car_owner
    @current_car_owner ||= CarOwner.find_by(id: session[:car_owner_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_car_owner.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:car_owner_id)
    @current_car_owner = nil
  end

end
