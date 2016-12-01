# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#car_model_select').hide()
  $('.repair-name-custom-input').hide()
  $('#car_make_select').hide()
  $('.rate_experience_section').hide()

  $(".repair-name-custom").click ->
    $('.repair-name-custom-input').show()
    $('.repair-cat-hidden').val(1)
    $('.repair-name-hidden').val(1)
    $('.repair_name_div').text('Select Repair')
    $("#repair_submission_repair_name_custom").focus()
    

  $('#car_year_select').change ->
    $('#car_make_select').empty().append('<option selected>Make</option>')
    $('#car_model_select').empty().append('<option selected>Model</option>')
    car_year = $('#car_year_select :selected').text()
    $.ajax
      type: "GET"
      url: "/fetch_car_makes"
      data: {car_year:"year_" + car_year}
      dataType: "json"
      success: (data) ->
        $.each data, (index, value) ->
          $('#car_make_select').append('<option value='+ data[index].id+'>'+data[index].name+'</option>')
        $('#car_make_select').show()

  $('#car_make_select').change ->
    car_year = $('#car_year_select :selected').text()
    car_make = $('#car_make_select :selected').val()
    $.ajax
      type: "GET"
      url: "/fetch_car_models"
      data: {car_year:"year_" + car_year, car_make_id: car_make}
      dataType: "json"
      success: (data) ->
        $('#car_model_select').empty().append('<option selected>Model</option>')
        $.each data, (index, value) ->
          $('#car_model_select').append('<option value='+ data[index].id+'>'+data[index].name+'</option>')
        $('#car_model_select').show()

  $('.repair_date_select').change ->
    $('.rate_experience_section').slideDown()

  # Update repair select title based on repair chosen
  $('.repair_name_div').text('Select Repair')
  $(".repair-name-text").click ->
    $('.repair-name-custom-input').hide()
    $('.repair-name-custom-input').val("")
    # Update Select field text based on repair clicked
    repair_name = $(this).text()
    repair_category = $(this).data();
    $('.repair_name_div').text(repair_category.cat + ' - ' + repair_name)
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

