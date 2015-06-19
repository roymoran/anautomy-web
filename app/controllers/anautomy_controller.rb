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
    $average_repair_cost = rand(600..1200)

    $average_parts_cost = (0.3 * $average_repair_cost).round(3)
    $average_labor_cost = (0.7 * $average_repair_cost).round(3)

    #flash.now[:notice] = "#{car} #{repair}"
    if !($car.nil?) || !($repair.nil?)
       redirect_to action: :repairs
    end
    #redirect_to "repairs"
  end

  def repairs
        @car = $car
        @repair = $repair
        @average_repair_cost = $average_repair_cost
        @average_parts_cost = $average_parts_cost
        @average_labor_cost = $average_labor_cost

  end

  def submissions
    @car = $car
    @repair = $repair
    @average_repair_cost = $average_repair_cost
    @average_parts_cost = $average_parts_cost
    @average_labor_cost = $average_labor_cost
  end

end
