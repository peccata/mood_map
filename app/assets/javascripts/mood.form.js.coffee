$("input#mood_state").change ->
  $("span#mood_display").text $(this).val()

$(document).ready ->
navigator.geolocation.getCurrentPosition (position) ->
  document.getElementById('mood_latitude').value = position.coords.latitude
  document.getElementById('mood_longitude').value = position.coords.longitude
