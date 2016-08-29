# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('#car_model_select').hide()
	car_models = $('#car_model_select').html()
	$('#car_make_select').change ->
		car_make = $('#car_make_select :selected').text()
		options = $(car_models).filter("optgroup[label='#{car_make}']").html()
		if options
			$('#car_model_select').html(options)
			$('#car_model_select').prepend $("<option selected>Select Model</option>")
			$('#car_model_select').show()
		else
			$('#car_model_select').empty()
			$('#car_model_select').hide()