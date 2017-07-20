class SearchesController < ApplicationController

  def new
  end

  def create
    # validate input for car, repair, and location
    # check which values are available and which are missing
    # based on input create a search strategy for each
    @search = Search.new(search_params)

    @car_name = car_name(@search.car_year_id, @search.car_make_id, @search.car_model_id)

    #flash[:info] = "In create action with year: " + @search.car_year_id + " make: " + @search.car_make_id + " model: " +  @search.car_model_id + " location: " + @search.location + " or " + @search.search_street_number + " " + @search.search_route + " " + @search.search_locality + " " + @search.search_administrative_area_level_1 + " " + @search.search_postal_code + " " + @search.search_country

    # validation here in case bad values passed, return back to search if validation fails
    redirect_to search_path location: @search.location, car: @car_name, year_id: @search.car_year_id, make_id: @search.car_make_id, model_id: @search.car_model_id, repair: @search.repair_name,  search_street_number: @search.search_street_number, search_route: @search.search_route, search_locality: @search.search_locality, search_administrative_area_level_1: @search.search_administrative_area_level_1, search_postal_code: @search.search_postal_code, search_country: @search.search_country
    
  end
  
  def show
    # Data for search results view 
  	@car = params[:car] 
    
    # Data for Location Search
    params[:search_street_number] # Place Address, 2906
    params[:search_route]  # Route, S. Throop St. 
    city = params[:search_locality] # City
    state = params[:search_administrative_area_level_1] # State, ISO 3166-2
    zip = params[:search_postal_code] # Zip Code, 60608
    params[:search_country] # Country, United State

    # Data for Car Search 
    year_id = params[:year_id]
    make_id = params[:make_id]
    model_id = params[:model_id]

    # Data for Repair Search
  	repair_name_id = params[:repair]


  	@year = CarYear.find(year_id)
  	@make = CarMake.find(make_id)
  	@model = CarModel.find(model_id)

  	@repair = RepairName.find(repair_name_id)
    @repair_name = @repair.name # Data for view 


  	# return all repair submissions made for a given car and repair_name_id
  	# repair_name_id cannot be 1 otherwise we use a LIKE operation for this query 
  	# no location data provided
  	# validate location is null before executing this query

    # search for repairs given car and repair name id
  	# if no location is provided, add option to insert location on search results view and redo search with location data
  	#@final_submissions = RepairSubmission.joins(:car, :repair).where(cars: {car_year_id: year_id, car_make_id: make_id, car_model_id: model_id}).where(repairs: {repair_name_id: repair_name_id})
    #@average_repair_cost = (@final_submissions.count > 0) ? average_cost(@final_submissions) : nil
  	
    # search for repair given location, car, and repair name id
    @final_submissions = RepairSubmission.joins(:shop, :car, :repair).where(shops: {shop_city: city, shop_state_code: state, shop_zip: zip}).where(cars: {car_year_id: year_id, car_make_id: make_id, car_model_id: model_id}).where(repairs: {repair_name_id: repair_name_id})
    @average_repair_cost = (@final_submissions.count > 0) ? average_cost(@final_submissions) : nil

  	# repair search given car (year make and model id) and repair (repair name or repair id)
  	
  	#get IP address from client
  	@ip = request.remote_ip

  end

  private

    def search_params
      params.require(:search).permit(:car_make_id, :car_model_id, :car_year_id, :location, :repair_category, :repair_name, :search_street_number, :search_route, :search_locality, :search_administrative_area_level_1, :search_postal_code, :search_country)
    end

    # Return the car name given id's of the year, make
    # and model
    def car_name(car_year_id, car_make_id, car_model_id)
      @year = CarYear.find(car_year_id).year
      @make = CarMake.find(car_make_id).name
      @model = CarModel.find(car_model_id).name
      return @year.to_s + ' ' + @make + ' ' + @model
    end

    # Calculate the average cost of a repair based
    # on list of repairs passed to method
    # TODO: Error check division by zero, meaning a list of 0 repairs was passed in
    def average_cost(repairs)
      total_cost = 0
      repairs.each do |r|
        total_cost = total_cost + r.total_cost.to_f
      end
      average_cost = total_cost / repairs.count
      return average_cost
    end

end
