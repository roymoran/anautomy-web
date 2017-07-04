# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('.mp-repair-searched').click ->
		car_name_search = $('.mp-car-searched').val()
		repair_name_searched = $('.mp-repair-name-searched').val()
		mixpanel.track 'Repair Searched Homepage',
			'Car Name Searched': car_name_search
			'Repair Name Searched': repair_name_searched

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

	$( ".search-location" ).focus ->
		if 'geolocation' of navigator
			console.log("geolocation is available")
			navigator.geolocation.getCurrentPosition (position) ->
				console.log("Lat: " + position.coords.latitude + "\n" + "Long:" + position.coords.longitude)
				$.ajax
					type: "GET"
					url: "https://maps.googleapis.com/maps/api/geocode/json?latlng="+position.coords.latitude+","+position.coords.longitude+"&key="
					dataType: "json"
					success: (data) ->
						console.log(data)
						console.log(data.results[3].formatted_address)
						$('.search-location').val(data.results[3].formatted_address)
		else
			console.log("geolocation IS NOT available")

	$('#car_year_select_home').change ->
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