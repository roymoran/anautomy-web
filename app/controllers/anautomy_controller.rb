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
    @car = params['car_type']
    @repair = params['repair']

    #flash.now[:notice] = "#{car} #{repair}"
    if !(@car.nil?) || !(@repair.nil?)

      if !(@repair.nil?)
        @repair = @repair.split.map(&:capitalize).join(' ')
      end
      if !(@car.nil?)
       @car = @car.split.map(&:capitalize).join(' ')
      end

    session[:current_car] = @car 
    session[:current_repair] = @repair
      
      @car_url = @car.dup
      @car_url.gsub!(" ","+")
      #@url = "https://www.googleapis.com/customsearch/v1?cx=009468579186160092243%3Awxdfq1__0fm&q=/#{@car_url}&imgSize=xlarge&searchType=image&num=1&key=AIzaSyAmhpV6pFbasloHZzO7Byr-lenZVB3Bd1Y"
      #@image_link = JSON.parse(HTTParty.get(@url).body)["items"][0]["link"]
      @image_link = "http://rack.2.mshcdn.com/media/ZgkyMDEzLzA1LzA5L2RiL1Rlc2xhTW9kZWxTLjY2YzRlLmpwZwpwCXRodW1iCTEyMDB4NjI3IwplCWpwZw/651c4379/334/Tesla-Model-S.jpg"
      session[:image_link] = @image_link


      #google_json_response = HTTParty.get("https://api.stackexchange.com/2.2/questions?site=stackoverflow")
      #puts google_json_response.body
      #$image_link = google_json_response["link"]
      #$image_link = "testtestetstststs"

      redirect_to action: :repairs
    end
    #redirect_to "repairs"
  end

  def repairs
    @average_repair_cost = rand(600..1200)
    session[:average_repair_cost] = @average_repair_cost

    @average_parts_cost = (0.3 * @average_repair_cost).round
    @average_labor_cost = (0.7 * @average_repair_cost).round
    session[:average_parts_cost] = @average_parts_cost
    session[:average_labor_cost] = @average_labor_cost
    
    @image_link = session[:image_link]
    @car = session[:current_car]
    @repair = session[:current_repair]
  end

  def submissions

        @car = session[:current_car]
        @repair = session[:current_repair]
        @average_repair_cost = session[:average_repair_cost]
        @average_repair_cost = session[:average_repair_cost]
        @average_parts_cost = session[:average_parts_cost]
        @average_labor_cost = session[:average_labor_cost]
        @image_link = session[:image_link]

        @firstResult = (@average_repair_cost-(@average_repair_cost*0.35)).round
        @firstPart = (0.3 * @firstResult).round
        @firstLabor = (0.7 * @firstResult).round

        @secondResult = (@average_repair_cost-(@average_repair_cost*0.30)).round
        @secondPart = (0.3 * @secondResult).round
        @secondLabor = (0.7 * @secondResult).round

        #@thirdResult = (@average_repair_cost-(@average_repair_cost*0.25)).round
        #@thirdPart =(0.3 * @thirdResult).round
        #@thirdLabor = (0.7 * @thirdResult).round

        #@fourthResult = (@average_repair_cost-(@average_repair_cost*0.20)).round
        #@fourthPart = (0.3 * @fourthResult).round
        #@fourthLabor = (0.7 * @fourthResult).round


        @fifthResult = (@average_repair_cost+(@average_repair_cost*0.05)).round
        @fifthPart = (0.3 * @fifthResult).round
        @fifthLabor = (0.7 * @fifthResult).round

        @sixthResult = (@average_repair_cost+(@average_repair_cost*0.1)).round
        @sixthPart = (0.3 * @sixthResult).round
        @sixthLabor = (0.7 * @sixthResult).round

        @seventhResult = (@average_repair_cost+(@average_repair_cost*0.15)).round
        @seventhPart = (0.3 * @seventhResult).round
        @seventhLabor =  (0.7 * @seventhResult).round

        @eighthResult = (@average_repair_cost+(@average_repair_cost*0.2)).round
        @eighthPart = (0.3 * @eighthResult).round
        @eighthLabor = (0.7 * @eighthResult).round

        @ninthResult = (@average_repair_cost+(@average_repair_cost*0.25)).round
        @ninthPart = (0.3 * @ninthResult).round
        @ninthLabor = (0.7 * @ninthResult).round

        @tenthResult = (@average_repair_cost+(@average_repair_cost*0.30)).round
        @tenthPart = (0.3 * @tenthResult).round
        @tenthLabor =  (0.7 * @tenthResult).round

        @eleventhResult = (@average_repair_cost+(@average_repair_cost*0.35)).round
        @eleventhPart = (0.3 * @eleventhResult).round
        @eleventhLabor = (0.7 * @eleventhResult).round
      
  end

end
