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

    # for demo purposes global variables will be declared for user input
    $car = params['car_type']
    $repair = params['repair']
    $average_repair_cost = rand(600..1200)

    $average_parts_cost = (0.3 * $average_repair_cost).round(3)
    $average_labor_cost = (0.7 * $average_repair_cost).round(3)

    #flash.now[:notice] = "#{car} #{repair}"
    if !($car.nil?) || !($repair.nil?)
      
      $car_url = $car.dup
      $car_url.gsub!(" ","+")
      url = "https://www.googleapis.com/customsearch/v1?cx=009468579186160092243%3Awxdfq1__0fm&q=/#{$car_url}&imgSize=xlarge&searchType=image&num=1&key=AIzaSyAmhpV6pFbasloHZzO7Byr-lenZVB3Bd1Y"
      $image_link = JSON.parse(HTTParty.get(url).body)["items"][0]["link"]

      #$image_link = "http://wordpress.carthrottle.com/wp-content/uploads/2013/10/smg_the-car-spy.jpg"



      #google_json_response = HTTParty.get("https://api.stackexchange.com/2.2/questions?site=stackoverflow")
      #puts google_json_response.body
      #$image_link = google_json_response["link"]
      #$image_link = "testtestetstststs"

      redirect_to action: :repairs
    end
    #redirect_to "repairs"
  end

  def repairs
    flash.now[:notice] = "#{$image_link}"
        @car_lower = $car
        @car = @car_lower.split.map(&:capitalize).join(' ')

        @repair_lower = $repair
        @repair = @repair_lower.split.map(&:capitalize).join(' ')

        @average_repair_cost = $average_repair_cost
        @average_parts_cost = $average_parts_cost
        @average_labor_cost = $average_labor_cost
        @image_link = $image_link

  end

  def submissions
    @car_lower = $car
    @car = @car_lower.split.map(&:capitalize).join(' ')

    @repair_lower = $repair
    @repair = @repair_lower.split.map(&:capitalize).join(' ')

    @average_repair_cost = $average_repair_cost
    @average_parts_cost = $average_parts_cost
    @average_labor_cost = $average_labor_cost
    @image_link = $image_link
  end

end
