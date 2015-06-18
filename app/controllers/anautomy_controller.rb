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

    # for demo purposes a global variable will be declared for user input
    $car = params['car_type']
    $repair = params['repair']

    #flash.now[:notice] = "#{car} #{repair}"
    if !($car.nil?) || !($repair.nil?)
       redirect_to action: :repairs
    end
    #redirect_to "repairs"
  end

  def repairs
        @car = $car
        @repair = $repair
  end

  def submissions
    @car = $car
    @repair = $repair
  end

end
