# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

	$('.mp-service-request-created').click ->
		mixpanel.track 'Repair Scheduled'

	$("form#apply_coupon_code_form").on("ajax:success", (e, data, status, xhr) ->
		document.getElementById("coupon_validation_message").textContent=data.message;
		document.getElementById("service_request_coupon_code").value = document.getElementById("coupon_code").value;
	).on "ajax:error", (e, xhr, status, error) ->
		console.log('Error updating current mileage')

	$("form#apply_coupon_code_form").on("ajax:success", (e, data, status, xhr) ->
		document.getElementById("coupon_validation_message").textContent=data.message;
		document.getElementById("service_request_coupon_code").value = document.getElementById("coupon_code").value;
	).on "ajax:error", (e, xhr, status, error) ->
		console.log('Error updating current mileage')
	
	$('form#new_service_request').submit (e) ->
		e.preventDefault()
		valid = true
		valid = validateCarSelected() && validateLocality() && validateRepairSelected() && validateDayTimeSelected() && validatePhoneNumber()
		if valid # continue with form submission if valid
			$(this).unbind('submit').submit()
		else
			validateCarSelected()
			validateLocality()
			validateRepairSelected()
			validateDayTimeSelected()
			validatePhoneNumber()


	
	@validateLocality = () ->
		pickupLocation = document.getElementById("autocomplete")
		invalidPickup = document.getElementById("invalid-pickup-location")
		validLocalities = ["Seattle"]
		localityIsValid = false
		validLocalitiesMessage = "Location must be in -"
		location = document.getElementById('autocomplete').value
		validLocalities.forEach (validLocality, index, array) ->
			if index == array.length - 1 && array.length != 1 # find when iteration is on last element
				validLocalitiesMessage = validLocalitiesMessage + " or " + validLocality + "."
			else if index == array.length - 1 && array.length == 1
				validLocalitiesMessage = validLocalitiesMessage + " " + validLocality + "."
			else 
				validLocalitiesMessage = validLocalitiesMessage + " " + validLocality + ","

			if location.includes(validLocality)
				localityIsValid = true
		if localityIsValid
			pickupLocation.classList.remove("invalid-field")
			if invalidPickup != null
				invalidPickup.remove()
		else
			pickupLocation.classList.add("invalid-field")
			if invalidPickup == null
				pickupLocation.insertAdjacentHTML("afterend", "<div id='invalid-pickup-location' class='invalid-field-msg'>City is invalid. #{validLocalitiesMessage}</div>")
		return localityIsValid
	
	@validateCarSelected = () ->
		carSelected = document.getElementById('service_request_car_id').value
		carSelectMenu = document.getElementById("service_request_car_id")
		invalidCar = document.getElementById("invalid-car-selected")

		if carSelected == "0"
			carSelectMenu.classList.add("invalid-field")
			if invalidCar == null
				carSelectMenu.insertAdjacentHTML("afterend", "<div id='invalid-car-selected' class='invalid-field-msg'>Car is required.</div>")
			return false
		else
			carSelectMenu.classList.remove("invalid-field")
			if invalidCar != null
				invalidCar.remove()
			return true

	@validateRepairSelected = () ->
		repairSelectModal = document.getElementById("repair-select-modal")
		repairSelected = $("#service_request_repair_name").val()
		invalidRepair = document.getElementById("invalid-repair-selected")
		if (repairSelected == "")
			repairSelectModal.classList.add("invalid-field")
			if invalidRepair == null
				repairSelectModal.insertAdjacentHTML("afterend", "<div id='invalid-repair-selected' class='invalid-field-msg'>Repair is required.</div>")
			return false
		else
			repairSelectModal.classList.remove("invalid-field")
			if invalidRepair != null
				invalidRepair.remove()
			return true
	
	@validateDayTimeSelected = () ->
		dayTimeSelectMenus = document.getElementById("day-time-select")
		daySelected = document.getElementById("service_request_preferred_day")
		timeSelected = document.getElementById("service_request_preferred_time")
		invalidDayTime = document.getElementById("invalid-day-time-selected")
		
		if	(daySelected.value == "0" || timeSelected.value == "0")
			daySelected.classList.add("invalid-field")
			timeSelected.classList.add("invalid-field")
			if invalidDayTime == null
				dayTimeSelectMenus.insertAdjacentHTML("afterend", "<div id='invalid-day-time-selected' class='invalid-field-msg'>Day and time are required.</div>")
			return false
		else
			daySelected.classList.remove("invalid-field")
			timeSelected.classList.remove("invalid-field")
			if invalidDayTime != null
				invalidDayTime.remove()
			return true
	
	@validatePhoneNumber = () ->
		phoneNumberField = document.getElementById("car_owner_phone_number")
		invalidPhoneNumber = document.getElementById("invalid-phone-number")
		if(phoneNumberField == null) # phone number field may not exist after erb processed
			return true
		
		if(phoneNumberField.value == "")
			phoneNumberField.classList.add("invalid-field")
			if invalidPhoneNumber == null
				phoneNumberField.insertAdjacentHTML("afterend", "<div id='invalid-phone-number' class='invalid-field-msg'>Phone is required.</div>")
			return false
		else
			phoneNumberField.classList.remove("invalid-field")
			if invalidPhoneNumber != null
				invalidPhoneNumber.remove()
			return true


		