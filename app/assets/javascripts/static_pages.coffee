# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('#region_winery_div #region').click(->
    $("#dropdown_div #region").show();
    $("#dropdown_div #region select").removeAttr("disabled");
    $("#dropdown_div #region input").removeAttr("disabled");

    $("#dropdown_div #enterprise").hide();
    $("#dropdown_div #enterprise select").attr("disabled", true);
    $("#dropdown_div #enterprise input").attr("disabled", true);

  ).click()

  $('#region_winery_div #winery').click(->
    $("#dropdown_div #region").hide();
    $("#dropdown_div #region select").attr("disabled", true);
    $("#dropdown_div #region input").attr("disabled", true);

    $("#dropdown_div #enterprise").show();
    $("#dropdown_div #enterprise select").removeAttr("disabled");
    $("#dropdown_div #enterprise input").removeAttr("disabled");
  ).click()

$(document).ready(ready)
$(document).on('page:load', ready)