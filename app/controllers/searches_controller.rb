class SearchesController < ApplicationController

  def new
  end

  def create
    # validate input for car, repair, and location
    # check which values are available and which are missing
    # based on input create a search strategy for each
    @search = Search.new(search_params)
    flash[:info] = "In Create action with year: " + @search.car_year_id + " make: " + @search.car_make_id + " model: " +  @search.car_model_id
    render :show
    
  end
  
  def show
  	params[:location]
  	params[:car] 
  	params[:repair]

  	repair_name_id = 2
  	
  	make_id = 82
  	year_id = 22
  	model_id = 12018

  	@year = CarYear.find(year_id)
  	@make = CarMake.find(make_id)
  	@model = CarModel.find(model_id)

  	@repair = RepairName.find(repair_name_id)
  	
  	# return all repair submissions made for a given car and repair_name_id
  	# repair_name_id cannot be 1 otherwise we use a LIKE operation for this query 
  	# no location data provided
  	# validate location is null before executing this query
  	# if params[:location] is null, add option to insert location on search results view and redo search with location data
  	@repairs = RepairSubmission.joins(:car, :repair).where(:cars => {:car_year_id => year_id, :car_make_id => make_id, :car_model_id => model_id}).where(:repairs => {:repair_name_id => repair_name_id})

  	# filter repair submissions based on location of shop

  	# repair search given car (year make and model id) and repair (repair name or repair id)
  	
  	#get IP address from client
  	@ip = request.remote_ip

  end

  private

    def search_params
      params.require(:search).permit(:car_make_id, :car_model_id, :car_year_id)
    end


end
