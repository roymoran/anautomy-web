class AnautomyController < ApplicationController

  def home
    @subscriber = Subscriber.new
    @repairSubmission = RepairSubmission.new
    @search = Search.new
    @google_api_key = Rails.application.secrets.google_api_key

    @repair_category = RepairCategory.all.offset(1)
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

      @image_link = "http://rack.2.mshcdn.com/media/ZgkyMDEzLzA1LzA5L2RiL1Rlc2xhTW9kZWxTLjY2YzRlLmpwZwpwCXRodW1iCTEyMDB4NjI3IwplCWpwZw/651c4379/334/Tesla-Model-S.jpg"
      session[:image_link] = @image_link

      redirect_to action: :repairs
    end
    #redirect_to "repairs"
  end

  def about
  end

  def oaq
  end

  def tos
  end

  def transparency
  end

  def submission
  end

  def service
    
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

    @low_range = (@average_repair_cost-(@average_repair_cost*0.35)).round
    @high_range = (@average_repair_cost+(@average_repair_cost*0.35)).round

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
