$("input#mood_state").change ->
  $("span#mood_display").text $(this).val()
