class AnautomyController < ApplicationController

  def home
    @subscriber = Subscriber.new
    @repairSubmission = RepairSubmission.new
    @car_owner = CarOwner.new
    @car = params['car_type']
    @repair = params['repair']

    if !(@car.nil?) || !(@repair.nil?)

      if !(@repair.nil?)
        @repair = @repair.split.map(&:capitalize).join(' ')
      end
      if !(@car.nil?)
       @car = @car.split.map(&:capitalize).join(' ')
      end

    session[:current_car] = @car 
    session[:current_repair] = @repair
      

      #@car_url = @car.dup
      #@car_url.gsub!(" ","+")
      #@url = "https://www.googleapis.com/customsearch/v1?cx=009468579186160092243%3Awxdfq1__0fm&q=/#{@car_url}&imgSize=xlarge&searchType=image&num=1&key=AIzaSyCCDwoOj6Wz7L2HNxfSwYBSqeTg-DT4wNA"
      #@image_body = HTTParty.get(@url).body
      #@image_link = Oj.load(@image_body)["items"][0]["link"]
      @image_link = "http://rack.2.mshcdn.com/media/ZgkyMDEzLzA1LzA5L2RiL1Rlc2xhTW9kZWxTLjY2YzRlLmpwZwpwCXRodW1iCTEyMDB4NjI3IwplCWpwZw/651c4379/334/Tesla-Model-S.jpg"
      session[:image_link] = @image_link

      redirect_to action: :repairs
    end
    #redirect_to "repairs"
  end

  def about
    @car_owner = CarOwner.new
  end

  def oaq
    @car_owner = CarOwner.new
  end

  def transparency
    @car_owner = CarOwner.new
  end

  def submission
    @car_owner = CarOwner.new
  end

  def repairs
    @car_owner = CarOwner.new
    @average_repair_cost = rand(600..1200)
    session[:average_repair_cost] = @average_repair_cost

    @average_parts_cost = (0.3 * @average_repair_cost).round
    @average_labor_cost = (0.7 * @average_repair_cost).round
    session[:average_parts_cost] = @average_parts_cost
    session[:average_labor_cost] = @average_labor_cost
    
    @image_link = session[:image_link]
    @car = session[:current_car]
    @repair = session[:current_repair]

    @low_range = (@average_repair_cost-(@average_repair_cost*0.35)).round
    @high_range = (@average_repair_cost+(@average_repair_cost*0.35)).round

  end

  def submissions
    @car_owner = CarOwner.new
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
