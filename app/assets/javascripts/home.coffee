# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

setup = ->
   $(".maintenances-completed-table").hide()
   $(".maintenances-table").show()

$(document).on 'turbolinks:load', ->
  setup()

  # Check for click events on the navbar burger icon
  $('.navbar-burger').click ->
    # Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
    $('.navbar-burger').toggleClass 'is-active'
    $('.navbar-menu').toggleClass 'is-active'

  $('.maintenances').click ->
    $(this).addClass('is-active')
    $('.maintenances-completed').removeClass('is-active')
    $('.maintenances-canceled').removeClass('is-active')
    $(".maintenances-table").show()
    $(".maintenances-completed-table").hide()
    $(".maintenances-canceled-table").hide()

  $('.maintenances-completed').click ->
    $(this).addClass('is-active')
    $('.maintenances').removeClass('is-active')
    $('.maintenances-canceled').removeClass('is-active')
    $(".maintenances-completed-table").show()
    $(".maintenances-table").hide()
    $(".maintenances-canceled-table").hide()

  $('.maintenances-canceled').click ->
    $(this).addClass('is-active')
    $('.maintenances').removeClass('is-active')
    $('.maintenances-completed').removeClass('is-active')
    $(".maintenances-canceled-table").show()
    $(".maintenances-table").hide()
    $(".maintenances-completed-table").hide()

  $('.bxslider').bxSlider
    auto: true
    autoControls: true
    stopAutoOnClick: true
    pager: true
    slideWidth: 600

  $(".bx-wrapper").css("margin","auto");
