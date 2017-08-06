# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

	$('.allSubissionsBlock').on 'click', '.demo_button_custom_submission, .demo_button_custom_submission_sm', ->
		place_id = $(this).data("value")
		$.ajax
			type: "GET"
			url: "/api/place_details"
			data: {place_id: place_id}
			dataType: "json"
			success: (data) ->
				place = data.result
				prepareShopProfile(place)				
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

	@baseUrl = (place_url) ->
		if place_url == undefined
			return ""
		place_root_url = place_url
		place_root_url = place_root_url.replace("https://", "")
		place_root_url = place_root_url.replace("http://", "")
		place_root_url = place_root_url.replace("www.", "")
		place_root_url = place_root_url.split('/')[0]
		return place_root_url = place_root_url.trim()

	@placeRatingClass = (rating) ->
		classRating = ""
		num = roundHalf(rating)
		switch num
			when 0
    			classRating = ''
    		when 0.5
    			classRating = "halfstar"
    		when 1
    			classRating = "star1"
    		when 1.5
    			classRating = "half1star"
    		when 2
    			classRating = "star2"
    		when 2.5
    			classRating = "half2star"
    		when 3
    			classRating = "star3"
    		when 3.5
    			classRating = "half3star"
    		when 4
    			classRating = "star4"
    		when 4.5
    			classRating = "half4star"
    		when 5
    			classRating = "star5"
	
	@roundHalf = (num) ->
    	return Math.round(num*2)/2;

    @prepareShopProfile = (place) ->
    	populateAddressDetails(place)
    	$('.shop-profile-name').empty().append(place.name)
    	$('.shop-profile-telephone').empty().append('<a href="tel:'+place.international_phone_number+'">'+(place.formatted_phone_number || "")+'</a>')
    	$('#shop-profile-website').empty().append(baseUrl(place.website))
    	$('#shop-profile-rating').removeClass();
    	d = document.getElementById("shop-profile-rating");
    	d.className += "rating " + (placeRatingClass(place.rating) || "")
    	a = document.getElementById('shop-profile-website');
    	a.href = place.website || "#"

    @prepareFirstShopProfile = (place) ->
    	$('.shop-profile-name').empty().append(place.name)
    	$('#shop-profile-rating').removeClass();
    	d = document.getElementById("shop-profile-rating");
    	d.className += "rating " + (placeRatingClass(place.rating) || "")


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