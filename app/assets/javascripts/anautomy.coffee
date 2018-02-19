# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	try
		mixpanel.track("Homepage")
	catch error
		console.log(error);
	
	$('.mp-repair-searched').click ->
		car_year = $('#car_year_select_home :selected').text()
		car_make = $('#car_make_select_home :selected').text()
		car_model = $('#car_model_select_home :selected').text()
		location = $('.mp-location').val()
		mixpanel.track 'Repair Searched Homepage',
			'Car Searched': car_year + ' ' + car_make + ' ' + car_model
			'Location Searched': location

	$('.mp-signup-modal').click ->
		mixpanel.track 'Sign Up Modal Opened'

	$('.mp-signup-modal-name').blur ->
		name = $('.mp-signup-modal-name').val()
		mixpanel.track 'Sign Up Modal Name',
			'Name': name

	$('.mp-signup-modal-email').blur ->
		email = $('.mp-signup-modal-email').val()
		mixpanel.track 'Sign Up Modal Email',
			'Email': email

	$('.mp-signup-modal-submitted').click ->
		mixpanel.track 'Sign Up Modal Submitted'

	$('.mp-login-modal').click ->
		mixpanel.track 'Login Modal Opened'

	$('.mp-login-modal-submitted').click ->
		mixpanel.track 'Login Modal Submitted'

	$('#car_year_select_home').change ->
		try
			mixpanel.track 'Year Selected'
		catch error
			console.log(error)
		$('#car_make_select_home').empty().append('<option selected>Make</option>')
		$('#car_model_select_home').empty().append('<option selected>Model</option>')
		car_year = $('#car_year_select_home :selected').text()
		$.ajax
			type: "GET"
			url: "/fetch_car_makes"
			data: {car_year:"year_" + car_year}
			dataType: "json"
			success: (data) ->
				$.each data, (index, value) ->
					$('#car_make_select_home').append('<option value='+ data[index].id+'>'+data[index].name+'</option>')

	$('#car_make_select_home').change ->
		try
			console.log('Make Selected')
			mixpanel.track 'Model Selected'
		catch error
			console.log(error)
		
		car_year = $('#car_year_select_home :selected').text()
		car_make = $('#car_make_select_home :selected').val()
		$.ajax
			type: "GET"
			url: "/fetch_car_models"
			data: {car_year:"year_" + car_year, car_make_id: car_make}
			dataType: "json"
			success: (data) ->
				$('#car_model_select_home').empty().append('<option selected>Model</option>')
				$.each data, (index, value) ->
					$('#car_model_select_home').append('<option value='+ data[index].id+'>'+data[index].name+'</option>')

	$('#car_model_select_home').change ->
		try
			console.log('Model Selected')
			mixpanel.track 'Model Selected'
		catch error
			console.log(error)

	$('.mp-location').change ->
		try
			console.log('Location changed')
			mixpanel.track 'Location Changed'
		catch error
			console.log(error)

	



