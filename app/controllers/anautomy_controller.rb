class AnautomyController < ApplicationController
  def home
  end

  def welcome
  	@subscriber = Subscriber.new
  	@repairSubmission = RepairSubmission.new
  end
end
