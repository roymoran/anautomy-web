# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('.input-invoice').change ->
    fileName = $(this).val()
    if fileName
      $('.file-uploaded').text("File selected: " + fileName.split('\\').pop())
    else
      $('.file-uploaded').text("File selected: None")