# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	# example async call to get model year id for given car year make and model
	year = '2013'
	make = 'honda'
	model = 'accord'
	$.ajax
		type: "GET"
		url: "/api/model_year_id"
		data: {car_year: year, car_make: make, car_model: model}
		dataType: "json"
		success: (data) ->
			console.log("Call for model year id: " + data.id)
			console.log(data)

	# example async call to get maintenance schedule given model_year_id 
	id = '100537293'
	$.ajax
		type: "GET"
		url: "/api/maintenance_schedule"
		data: {model_year_id: id}
		dataType: "json"
		success: (data) ->
			console.log("Maintenance schedule: ")
			console.log(data)