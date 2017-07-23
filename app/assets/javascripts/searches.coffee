# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

map = undefined
service = undefined
infowindow = undefined

@initialize = ->
  pyrmont = new (google.maps.LatLng)(-33.8665433, 151.1956316)
  map = new (google.maps.Map)(document.getElementById('map'),
    center: pyrmont
    zoom: 15)
  request = 
    location: pyrmont
    radius: '500'
    type: [ 'restaurant' ]
  service = new (google.maps.places.PlacesService)(map)
  service.nearbySearch request, callback
  return

@callback = (results, status) ->
  if status == google.maps.places.PlacesServiceStatus.OK
    i = 0
    while i < results.length
      place = results[i]
      createMarker results[i]
      i++
  return