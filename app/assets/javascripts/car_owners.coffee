# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->

  car_year = $('#car_year_select :selected').text() 
  $("#car_year_select").change ->
    car_year = $('#car_year_select :selected').text()
    console.log(car_year) 
 
  car_make = $('#car_make_select :selected').text()
  $('#car_make_select').change ->
  	car_make = $('#car_make_select :selected').text()
  	console.log(car_make)

  car_model = $('#car_model_select :selected').text()
  $('#car_model_select').change ->
  	car_model = $('#car_model_select :selected').text()
  	console.log(car_model)

	# getting modelyearid from edmunds
	# example async call to get model year id for given car year make and model
	year = '2015'
	make = 'Honda'
	model = 'Accord'
	$.ajax
		type: "GET"
		url: "/api/model_year_id"
		data: {car_year: year, car_make: make, car_model: model}
		dataType: "json"
		success: (data) ->
			console.log("Call for model year id: " + data.id)
			console.log(data)

	# getting maintenance schedule from edmunds
	# example async call to get maintenance schedule given model_year_id 
	modelyearid = '100537293'
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
	modelyearid = '100537293'
	$.ajax
		type: "GET"
		url: "/api/recalls"
		data: {model_year_id: modelyearid}
		dataType: "json"
		success: (data) ->
			console.log("Recalls w/ model_year_id: ")
			console.log(data)
