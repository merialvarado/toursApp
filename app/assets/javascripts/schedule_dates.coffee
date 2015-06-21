# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('#schedule_date_event_repeats').change(->
    event_repeats = $(this).val()
    if event_repeats == 'weekly'
      $('#weekly_div').show()
      $('#yearly_div').hide()
    else if event_repeats == 'yearly'
      $('#weekly_div').hide()
      $('#yearly_div').show()
    else if event_repeats == 'daily'
      $('#weekly_div').hide()
      $('#yearly_div').hide()
    return
  ).change()

  $(".multiselect").multiselect({
    includeSelectAllOption: false, 
    selectAllValue: 'All', 
    enableFiltering:true
  });

  alert("sample");

$(document).ready(ready)
$(document).on('page:load', ready)