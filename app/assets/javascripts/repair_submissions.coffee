# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('#car_model_select').hide()
	$('.total_cost_field').hide()
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

	# Update total_cost_field on date_select focus
	$(".select_date_submission_form").focus ->
		# implicitly convert string by multiplying it by 1
		parts_cost = 1 * $('.parts_cost_field').val()
		labor_cost = 1 * $('.labor_cost_field').val()
		total_cost = parts_cost + labor_cost
		$('.total_cost_field').val(total_cost)
	
	# The blur event is sent to an element when it loses focus.
	$(".parts_cost_field").blur ->
    	parts_cost = $('.parts_cost_field').val()

    $(".labor_cost_field").blur ->
    	labor_cost = $('.labor_cost_field').val()

    # Update repair select title based on repair chosen
    $('.repair_select_option').text("Repair Name")
    $(".repair-name-text").click ->
    	# Update Select field text based on repair clicked
    	repair_name = $(this).text()
    	repair_category = $(this).data();
    	$('.repair_select_option').text(repair_category.cat + ' - ' + repair_name)
