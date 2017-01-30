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

