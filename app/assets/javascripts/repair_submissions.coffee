# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#car_model_select').hide()
  $('#car_make_select').hide()
  $('.total_cost_field').hide()
  $('.rate_experience_section').hide()

  $('#car_year_select').change ->
    $('#car_make_select').show()
    $('#car_make_select').empty().append('<option selected>Make</option>')
    $('#car_model_select').empty().append('<option selected>Model</option>')
    car_year = $('#car_year_select :selected').text()
    console.log(car_year)
    $.ajax
      type: "GET"
      url: "/fetch_car_makes"
      data: {car_year:"year_" + car_year}
      dataType: "json"
      success: (data) ->
        console.log(data)
        $.each data, (index, value) ->
          $('#car_make_select').append('<option value='+ data[index].id+'>'+data[index].name+'</option>')
          console.log(data[index].name)

  $('#car_make_select').change ->
    car_year = $('#car_year_select :selected').text()
    car_make = $('#car_make_select :selected').val()
    console.log(car_make)
    $.ajax
      type: "GET"
      url: "/fetch_car_models"
      data: {car_year:"year_" + car_year, car_make_id: car_make}
      dataType: "json"
      success: (data) ->
        $('#car_model_select').show()
        console.log(data)
        $('#car_model_select').empty().append('<option selected>Model</option>')
        $.each data, (index, value) ->
          $('#car_model_select').append('<option value='+ data[index].id+'>'+data[index].name+'</option>')
          console.log(data[index].name)

  $('.repair_date_select').change ->
    $('.rate_experience_section').slideDown()

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
    $('.repair-cat-hidden').val(repair_category.catid)
    $('.repair-name-hidden').val(repair_category.repid)

  #implement gradual rating for cost, quality, and quickness of repair
  $('.quality-rating-row').hide()
  $('.quickness-rating-row').hide()

  $("input[name$='cost_rating']").click ->
   	#$('.cost-rating-row').hide("slow")
   	#$('.quality-rating-row').show("slow")
    $('.cost-rating-row').slideUp()
    $('.quality-rating-row').slideDown()

  $("input[name$='quality_rating']").click ->
   	#$('.quality-rating-row').hide("slow")
   	#$('.quickness-rating-row').show("slow")
    $('.quality-rating-row').slideUp()
    $('.quickness-rating-row').slideDown()

  $("input[name$='quickness_rating']").click ->
    #$('.quickness-rating-row').hide("slow")
    $('.quickness-rating-row').slideUp ->
      $('.fs-subtitle-rate').hide("slow")

