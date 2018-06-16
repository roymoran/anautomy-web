class AnautomyController < ApplicationController

  def home
    @subscriber = Subscriber.new
    @repairSubmission = RepairSubmission.new
    @search = Search.new

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

end
