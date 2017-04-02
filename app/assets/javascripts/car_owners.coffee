# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $("#car_year_select").change ->
    $('#car_make_select').empty().append('<option selected>Make</option>')
    $('#car_model_select').empty().append('<option selected>Model</option>')
    car_year = $('#car_year_select :selected').text()
    console.log(car_year) 
    tryFormSubmit()
 
  $('#car_make_select').change ->
    $('#car_model_select').empty().append('<option selected>Model</option>')  
    car_make = $('#car_make_select :selected').text()
    console.log(car_make)
    tryFormSubmit()

  $('#car_model_select').change ->
  	car_model = $('#car_model_select :selected').text()
  	console.log(car_model)
  	tryFormSubmit()

  @tryFormSubmit = () -> 
  	year_id = parseInt($('#car_year_select :selected').val())
  	make_id = parseInt($('#car_make_select :selected').val())
  	model_id = parseInt($('#car_model_select :selected').val())
  	if isNaN(year_id) || isNaN(model_id) || isNaN(make_id)
  		return
  	$.ajax
  		type: "POST"
  		url: "/cars"
  		data: {car:{car_year_id: year_id, car_make_id: make_id, car_model_id: model_id}}
  		success: (data) ->
  			$('#dash').fadeOut()
  			getModelYearId()
  			console.log("Car Created")
  		error: (data) ->
  			console.log("Error setting up dashboard")

	# getting modelyearid from edmunds
	# example async call to get model year id for given car year make and model
	@buildDashboard = (modelyearid) ->
		year = $('#car_year_select :selected').text()
		make = $('#car_make_select :selected').text()
		model = $('#car_model_select :selected').text()
		console.log('Edmunds API calls for ' + year + ' ' + make + ' ' + model)
		# getting maintenance schedule from edmunds
		# example async call to get maintenance schedule given model_year_id 
		$.ajax
			type: "GET"
			url: "/api/maintenance_schedule"
			data: {model_year_id: modelyearid}
			dataType: "json"
			success: (data) ->
				console.log("Maintenance schedule: ")
				console.log(data)

		# getting car true cost to own
		styleid = '200434889'
		zip = '60608'
		$.ajax
			type: "GET"
			url: "/api/tco_used"
			data: {style_id: styleid, zipcode: zip}
			dataType: "json"
			success: (data) ->
				console.log("TCO Used: ")
				console.log(data)

		# getting car true cost to own breakdown
		styleid = '200434889'
		zip = '60608'
		$.ajax
			type: "GET"
			url: "/api/tco_used_detailed"
			data: {style_id: styleid, zipcode: zip}
			dataType: "json"
			success: (data) ->
				console.log("TCO Used 5-yr Breakdown: ")
				console.log(data)

		# getting car true market value with typical options
		styleid = '200434889'
		zip = '60608'
		$.ajax
			type: "GET"
			url: "/api/tmv_typical"
			data: {style_id: styleid, zipcode: zip}
			dataType: "json"
			success: (data) ->
				console.log("TMV w/ Typical Options: ")
				console.log(data)

		# getting car true market value with given detailed car info
		styleid = '200434889'
		condition = 'rough'
		zip = '60608'
		mileage = '55464'
		$.ajax
			type: "GET"
			url: "/api/tmv_detailed"
			data: {style_id: styleid, zipcode: zip, condition: condition, mileage: mileage}
			dataType: "json"
			success: (data) ->
				console.log("TMV Given Details: ")
				console.log(data)

		# getting car recall information for car given modelyearid
		$.ajax
			type: "GET"
			url: "/api/recalls"
			data: {model_year_id: modelyearid}
			dataType: "json"
			success: (data) ->
				console.log("Recalls w/ model_year_id: ")
				console.log(data)

	@getModelYearId = () ->
		year = $('#car_year_select :selected').text()
		make = $('#car_make_select :selected').text()
		model = $('#car_model_select :selected').text()
		$.ajax
			type: "GET"
			url: "/api/model_year_id"
			data: {car_year: year, car_make: make, car_model: model}
			dataType: "json"
			success: (data) ->
				modelYearId = data.id
				if data.status == "NOT_FOUND"
					console.log("Error getting model year id.")
					return
				buildDashboard(modelYearId)
			error: (data) ->
				console.log("error getting model yearid")
