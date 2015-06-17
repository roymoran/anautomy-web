class AnautomyController < ApplicationController
  def home
  end

  def welcome
  	@subscriber = Subscriber.new
  	@repairSubmission = RepairSubmission.new
  end

  def thankyouforsubscribing
  	@repairSubmission = RepairSubmission.new
  end

  def thankyouforsubmitting
  	@subscriber = Subscriber.new
  end

  def homepage
    @subscriber = Subscriber.new
    @repairSubmission = RepairSubmission.new

    car = params['car_type']
    repair = params['repair']

    flash.now[:notice] = "#{car} #{repair}"
    render "repairs"
  end


end
