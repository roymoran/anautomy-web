# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('.allSubissionsBlock').on 'click', '.demo_button_custom_submission', ->
		place_id = $(this).data("value")
		$.ajax
			type: "GET"
			url: "/api/place_details"
			data: {place_id: place_id}
			dataType: "json"
			success: (data) ->
				place = data.result
				populateAddressDetails(place)

				$('.shop-profile-name').empty()
				$('.shop-profile-name').append(place.name)
				$('.shop-profile-telephone').empty()
				$('.shop-profile-telephone').append('<a href="tel:'+place.international_phone_number+'">'+place.formatted_phone_number+'</a>')


				a = document.getElementById('shop-profile-website');
				a.href = place.website
				
				console.log(place.rating)
				return true
			error: (data) ->
				console.log("error getting place details")

	@populateAddressDetails = (place) ->
		componentForm = 
			street_number: 'short_name'
			route: 'long_name'
			locality: 'long_name'
			administrative_area_level_1: 'short_name'
			postal_code: 'short_name'

		for component of componentForm
			document.getElementById(component).innerHTML = ''
			document.getElementById(component).disabled = false

		i = 0
		while i < place.address_components.length
			addressType = place.address_components[i].types[0]
			if componentForm[addressType]
				val = place.address_components[i][componentForm[addressType]]
				document.getElementById(addressType).innerHTML = val
			i++

#map = undefined
#service = undefined
#infowindow = undefined
#
#@initialize = ->
#  pyrmont = new (google.maps.LatLng)(-33.8665433, 151.1956316)
#  map = new (google.maps.Map)(document.getElementById('map'),
#    center: pyrmont
#    zoom: 15)
#  request = 
#    location: pyrmont
#    radius: '500'
#    type: [ 'restaurant' ]
#  service = new (google.maps.places.PlacesService)(map)
#  service.nearbySearch request, callback
#  return
#
#@callback = (results, status) ->
#  if status == google.maps.places.PlacesServiceStatus.OK
#    i = 0
#    while i < results.length
#      place = results[i]
#      createMarker results[i]
#      i++
#  return
#
#@createMarker = (place) ->
#  placeLoc = place.geometry.location
#  marker = new (google.maps.Marker)(
#    map: map
#    position: place.geometry.location)
#  google.maps.event.addListener marker, 'click', ->
#    infowindow.setContent place.name
#    infowindow.open map, this
#    return
#  return