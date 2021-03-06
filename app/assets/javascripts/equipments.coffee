# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


refreshTableColor = ->
  $.each $(".equipment_status"), (index,elem) ->
    switch $(elem).val()
        when 'working' then $(elem).parent().parent().attr('style',  'background-color:white')
        when 'repairable' then $(elem).parent().parent().attr('style',  'background-color:hsl(48, 100%, 67%)')
        when 'abandoned' then $(elem).parent().parent().attr('style',  'background-color:hsl(348, 100%, 61%)')

$(document).on 'turbolinks:load', ->
  $(".clear-button").click ->
    $(".name-input").val("")
    $(".model-name-input").val("")
    $(".department-select").val('')

  $.each $(".equipment_status"), (index,elem) ->
    switch $(elem).val()
        when 'working' then $(elem).parent().parent().attr('style',  'background-color:white')
        when 'repairable' then $(elem).parent().parent().attr('style',  'background-color:hsl(48, 100%, 67%)')
        when 'abandoned' then $(elem).parent().parent().attr('style',  'background-color:hsl(348, 100%, 61%)')

  $('.update-button').click ->
    refreshTableColor()

  $('.unarchived-equipments').click ->
    $(this).addClass('is-active')
    $('.archived-equipments').removeClass('is-active')
    $(".search-archived-equipments-table").hide()
    $(".search-equipments-table").show()

  $('.archived-equipments').click ->
    $(this).addClass('is-active')
    $('.unarchived-equipments').removeClass('is-active')
    $(".search-archived-equipments-table").show()
    $(".search-equipments-table").hide()

