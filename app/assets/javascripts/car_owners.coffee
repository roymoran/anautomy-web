# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

	$("#car_year_select").change ->
		$('#car_make_select').empty().append('<option selected>Make</option>')
		$('#car_model_select').empty().append('<option selected>Model</option>')
		car_year = $('#car_year_select :selected').text()
		tryFormSubmit()
 
	$('#car_make_select').change ->
		$('#car_model_select').empty().append('<option selected>Model</option>')  
		car_make = $('#car_make_select :selected').text()
		tryFormSubmit()

	$('#car_model_select').change ->
    	car_model = $('#car_model_select :selected').text()
    	tryFormSubmit()

    $('.mp-new-service-request').click ->
    	mixpanel.track 'To New Service Request Form'

  	# getting modelyearid from edmunds
  	@buildDashboard = (modelyearid, opts) ->
  		if isNaN(parseInt(modelyearid)) && isNaN(parseInt(opts['current_mileage'])) 
  	  		return
  		# populate maintenance schedule
    	buildMaintenanceSchedule(modelyearid, opts['current_mileage'])

		# populate recalls 
    	buildRecalls(modelyearid)
  
	@tryFormSubmit = () -> 
		year_id = parseInt($('#car_year_select :selected').val())
		make_id = parseInt($('#car_make_select :selected').val())
		model_id = parseInt($('#car_model_select :selected').val())
		# only get model year id when all fields are present
		# TODO: This wil break when we change primary keys for car makes/models to text
		if isNaN(year_id) || isNaN(model_id) || isNaN(make_id)
			return
		getModelYearId()

	@getModelYearId = () ->
		year = $('#car_year_select :selected').text()
		make = $('#car_make_select :selected').text()
		model = $('#car_model_select :selected').text()
		model_parsed = model

		# Removing any instance of 2WD, 4WD, AWD, etc. to increase likliehood of getting
		# modelyearid from edmunds api call
		model_parsed = model_parsed.replace("2WD", "")
		model_parsed = model_parsed.replace("4WD", "")
		model_parsed = model_parsed.replace("AWD", "")
		model_parsed = model_parsed.replace("FWD", "")
		model_parsed = model_parsed.replace("RWD", "")
		model_parsed = model_parsed.trim()

		$.ajax
			type: "GET"
			url: "/api/model_year_id"
			data: {car_year: year, car_make: make, car_model: model_parsed}
			dataType: "json"
			success: (data) ->
				modelYearId = data.id
				if data.status == "NOT_FOUND"
					# TODO: retry getting modelyearid with modified model name 
					console.log("Error getting model year id.")
					return
				$('#dashboard-car-name-1').append(year + ' ' + make + ' ' + model)
				$('#dashboard-car-name-2').append(year + ' ' + make + ' ' + model)
				$('#dashboard-car-name-3').append(year + ' ' + make + ' ' + model)
				getCarImage(modelYearId)
			error: (data) ->
				console.log("error getting model yearid")

	@buildMaintenanceSchedule = (modelyearid, currentMileage) ->
		# getting maintenance schedule from edmunds api
		$.ajax
			type: "GET"
			url: "/api/maintenance_schedule"
			data: {model_year_id: modelyearid}
			dataType: "json"
			success: (data) ->
				maintenanceList = data.actionHolder
				sortedMaintenanceList = sortMaintenanceList(maintenanceList, currentMileage)
				$('.maintenance-schedule-item').empty()
				$.each sortedMaintenanceList, (index, value) ->
					$('.maintenance-schedule-item').append('<div class="maintenance-item"><div class = "maintenance-item-title">' + sortedMaintenanceList[index].action + ' ' + sortedMaintenanceList[index].item + '<i class="fa fa-plus maintenance-item-icon"></i></div><div class="row"><div class="col-sm-9" style="font-size:1.2em;"><p>'+ sortedMaintenanceList[index].itemDescription+'</p></div><div class="col-sm-3"><button type="" class="btn btn-maintenance-item">Check at '+sortedMaintenanceList[index].intervalMileage+' mi.</button></div></div></div>')
				$( ".maintenance-item, .recall-item" ).accordion({collapsible: true,heightStyle: "content",active: false});
				$('.maintenance-schedule-message').empty()
				if sortedMaintenanceList.length == 0
					$('.maintenance-schedule-message').append('Good news, you don\'t have any upcoming repairs.')
				else
					$('.maintenance-schedule-message').append('You have '+sortedMaintenanceList.length+' repair(s) due in the next 1,000 miles.')

				$('#dashboard-container').removeClass("hide")
				$('#intial-dashboard-container').addClass("hide")
				
				console.log("Sorted maintenance schedule: ")
				console.log(sortedMaintenanceList)

	@buildRecalls = (modelyearid) ->
		# getting car recall information for given modelyearid
		$.ajax
			type: "GET"
			url: "/api/recalls"
			data: {model_year_id: modelyearid}
			dataType: "json"
			success: (data) ->
				recalls = data.recallHolder
				if data.recallHolder.length == 0
					$('.recalls-section-sub-title').append('There are no recalls for your car.')
					return
				$.each recalls, (index, value) ->
					$('.recall-items').append('<div class="recall-item"><div class = "maintenance-item-title">' + recalls[index].componentDescription + '<i class="fa fa-plus maintenance-item-icon"></i></div><div class="row"><div class="col-sm-12" style="font-size:1.2em;"><p>'+ recalls[index].defectCorrectiveAction+'</p></div></div></div>')
				$('.recalls-section-sub-title').append('You have '+recalls.length+' recall(s) for your car.')
				$( ".maintenance-item, .recall-item" ).accordion({collapsible: true,heightStyle: "content",active: false});
				console.log("Recalls w/ model_year_id")
				console.log(recalls)

	@createCar = (modelyearid, carImage) ->
		year_id = parseInt($('#car_year_select :selected').val())
		make_id = parseInt($('#car_make_select :selected').val())
		model_id = parseInt($('#car_model_select :selected').val())
		$.ajax
  			type: "POST"
  			url: "/cars"
  			data: {car:{car_year_id: year_id, car_make_id: make_id, car_model_id: model_id, edmunds_modelyearid: modelyearid, car_image: carImage}}
  			success: (data) ->
  				$('#dash').fadeOut()
  				$('#car_current_mileage_form').attr('action', '/cars/' + data);
  				console.log("Car Created, building dash")
  				buildDashboard(modelyearid, {})
  			error: (data) ->
  				console.log("Error setting up dashboard")
  	
	@getCarImage = (modelyearid) ->
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
				createCar(modelyearid, carImage)
			error: (data) ->
				console.log("error getting car image")


	@sortMaintenanceList = (maintenanceList, currentMileage) ->
  		newMaintenanceList = []
  		if currentMileage
  			#get maintenace schedule for provided mileage data
  			$.each maintenanceList, (index, value) ->
  				if maintenanceList[index].intervalMileage == 0
  					return true # if interval mileage is 0 remove from list
  				newIntervalMileage = maintenanceList[index].intervalMileage
  				while newIntervalMileage < currentMileage
  					newIntervalMileage = maintenanceList[index].intervalMileage + newIntervalMileage 
  				mileageRemainder = newIntervalMileage - currentMileage
  				if(mileageRemainder <= 1000)
  					newMaintenanceList.push(maintenanceList[index]);
  			return newMaintenanceList
  			console.log('Sorting by mileage ' + typeof(maintenanceList).toString())
  		else
  			#mileage data not provided, return general maintenance schedule
  			return maintenanceList
  			console.log('no current mileage provided')

	$("form#car_current_mileage_form").on("ajax:success", (e, data, status, xhr) ->
		console.log('Current Mileage updated')
		# call edmunds api and run algorithm to parse maintenance schedule
		# getting maintenance schedule information for given modelyearid
		buildMaintenanceSchedule(data.edmunds_modelyearid, $('#car_current_mileage').val())

		# based on mileage input by car owner
	).on "ajax:error", (e, xhr, status, error) ->
		console.log('Error updating current mileage')

	opts = {current_mileage: $('#car_current_mileage').val()}
	buildDashboard($('#edmunds_modelyearid').val(), opts)




