class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :intialize_car_owner
  protect_from_forgery with: :exception
  attr_accessor :car
  attr_accessor :repair
  attr_accessor :average_repair_cost
  attr_accessor :average_labor_cost
  attr_accessor :average_parts_cost
  attr_accessor :image_link
  
  include SessionsHelper
  include ServiceRequestsHelper

  def intialize_car_owner
    @car_owner = CarOwner.new
  end

end
