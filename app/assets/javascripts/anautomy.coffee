# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('.mp-repair-searched').click ->
		car_year = $('#car_year_select_home').find(":selected").text()
		car_make = $('#car_make_select_home').find(":selected").text()
		car_model = $('#car_model_select_home').find(":selected").text()
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

	# JS for Google Place Autocomplete API

	# This example displays an address form, using the autocomplete feature
    # of the Google Places API to help users fill in the information.

    # This example requires the Places library. Include the libraries=places
    # parameter when you first load the API. For example:
    # <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

	#placeSearch = undefined
	#autocomplete = undefined
	#componentForm = 
	#	street_number: 'short_name'
	#	route: 'long_name'
	#	locality: 'long_name'
	#	administrative_area_level_1: 'short_name'
	#	country: 'long_name'
	#	postal_code: 'short_name'

	#initAutocomplete = ->
		# Create the autocomplete object, restricting the search to geographical
		# location types.
		#autocomplete = new (google.maps.places.Autocomplete)(document.getElementById('autocomplete'), types: [ 'geocode' ])
		# When the user selects an address from the dropdown, populate the address
		# fields in the form.
		#autocomplete.addListener 'place_changed', fillInAddress
		#return

	#fillInAddress = ->
		# Get the place details from the autocomplete object.
		#place = autocomplete.getPlace()
		#for component of componentForm
			#document.getElementById(component).value = ''
			#document.getElementById(component).disabled = false

		# Get each component of the address from the place details
		# and fill the corresponding field on the form.
		#i = 0
		#while i < place.address_components.length
			#addressType = place.address_components[i].types[0]
			#if componentForm[addressType]
				#val = place.address_components[i][componentForm[addressType]]
				#document.getElementById(addressType).value = val
			#i++
		#return

	# Bias the autocomplete object to the user's geographical location,
	# as supplied by the browser's 'navigator.geolocation' object.
	#geolocate = ->
		#if navigator.geolocation
			#navigator.geolocation.getCurrentPosition (position) ->
			#geolocation = 
				#lat: position.coords.latitude
				#lng: position.coords.longitude
			#circle = new (google.maps.Circle)(
				#center: geolocation
				#radius: position.coords.accuracy)
			#autocomplete.setBounds circle.getBounds()
			#return
		#return
