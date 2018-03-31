# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

	$("#car_year_select").change ->
		$('#car_make_select').empty().append('<option selected>Make</option>')
		$('#car_model_select').empty().append('<option selected>Model</option>')
		car_year = $('#car_year_select :selected').text()
		$.ajax
			type: "GET"
			url: "/fetch_car_makes"
			data: {car_year:"year_" + car_year}
			dataType: "json"
			success: (data) ->
				$.each data, (index, value) ->
					$('#car_make_select').append('<option value='+ data[index].id+'>'+data[index].name+'</option>')
 
	$('#car_make_select').change ->
		$('#car_model_select').empty().append('<option selected>Model</option>')  
		car_make = $('#car_make_select :selected').val()
		car_year = $('#car_year_select :selected').text()
		$.ajax
			type: "GET"
			url: "/fetch_car_models"
			data: {car_year:"year_" + car_year, car_make_id: car_make}
			dataType: "json"
			success: (data) ->
				$('#car_model_select').empty().append('<option selected>Model</option>')
				$.each data, (index, value) ->
					$('#car_model_select').append('<option value='+ data[index].id+'>'+data[index].name+'</option>')

	$('#car_model_select').change ->
    	car_model = $('#car_model_select :selected').text()
    	tryFormSubmit()

    $('.mp-new-service-request').click ->
    	mixpanel.track 'To New Repair Scheduling Form'

  	@buildDashboard = (opts) ->
	  	if parseInt(opts['car_count']) == 0
		  	return
		  buildMaintenanceSchedule(opts['current_mileage'])
		  buildRecalls()
		  return
  
	@tryFormSubmit = () -> 
		year_id = parseInt($('#car_year_select :selected').val())
		make_id = parseInt($('#car_make_select :selected').val())
		model_id = parseInt($('#car_model_select :selected').val())
		# only get model year id when all fields are present
		# TODO: This wil break when we change primary keys for car makes/models to text
		if isNaN(year_id) || isNaN(model_id) || isNaN(make_id)
			return
		
		year = $('#car_year_select :selected').text()
		make = $('#car_make_select :selected').text()
		model = $('#car_model_select :selected').text()
		
		$('#dashboard-car-name-1').append(year + ' ' + make + ' ' + model)
		$('#dashboard-car-name-2').append(year + ' ' + make + ' ' + model)
		$('#dashboard-car-name-3').append(year + ' ' + make + ' ' + model)
		getCarImage()
		
	@buildMaintenanceSchedule = (currentMileage) ->
		$('.maintenance-schedule-message').empty().append('There\'s no maintenance information to show at the moment.')
		$('#dashboard-container').removeClass("hide")
		$('#intial-dashboard-container').addClass("hide")
	
	@buildRecalls = () ->
		$('.recalls-section-sub-title').empty().append('There\'s no recall information to show right now.')
		
	@createCar = (carImage) ->
		year_id = parseInt($('#car_year_select :selected').val())
		make_id = parseInt($('#car_make_select :selected').val())
		model_id = parseInt($('#car_model_select :selected').val())
		$.ajax
  			type: "POST"
  			url: "/cars"
  			data: {car:{car_year_id: year_id, car_make_id: make_id, car_model_id: model_id, edmunds_modelyearid: null, car_image: carImage}}
  			success: (data) ->
  				$('#dash').fadeOut()
  				$('#car_current_mileage_form').attr('action', '/cars/' + data);
				# build dashboard
				buildDashboard({car_count: 1}) # car count set to one to show dashboard
  			error: (data) ->
  				console.log("Error setting up dashboard")
  	
	@getCarImage = () ->
		year = $('#car_year_select :selected').text()
		make = $('#car_make_select :selected').text()
		model = $('#car_model_select :selected').text()

		$.ajax
			type: "GET"
			url: "/api/car_image"
			data: {car_year: year, car_make: make, car_model: model}
			dataType: "json"
			success: (data) ->
				carImage = data.items[0].link
				$(".profile-car-img").attr("src", carImage);
				createCar(carImage)
			error: (data) ->
				console.log("error getting car image")

	$("form#car_current_mileage_form").on("ajax:success", (e, data, status, xhr) ->
		# call edmunds api and run algorithm to parse maintenance schedule
		# getting maintenance schedule information for given modelyearid
		buildMaintenanceSchedule($('#car_current_mileage').val())

		# based on mileage input by car owner
	).on "ajax:error", (e, xhr, status, error) ->
		console.log('Error updating current mileage')

	opts = {car_count: $('#car_owner_car_count').val()}
	buildDashboard(opts)




