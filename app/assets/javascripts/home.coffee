# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

setup = ->
   $(".maintenances-completed-table").hide()
   $(".maintenances-table").show()

$(document).on 'turbolinks:load', ->
  setup()

  $('.maintenances').click ->
    $(this).addClass('is-active')
    $('.maintenances-completed').removeClass('is-active')
    $(".maintenances-completed-table").hide()
    $(".maintenances-table").show()

  $('.maintenances-completed').click ->
    $(this).addClass('is-active')
    $('.maintenances').removeClass('is-active')
    $(".maintenances-completed-table").show()
    $(".maintenances-table").hide()