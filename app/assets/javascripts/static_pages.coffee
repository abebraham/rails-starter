# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
	if $('body').attr('data-loaded') == 'T'
    return
  # My code
  meta_tag = document.querySelector("meta[name='action']").content
  if meta_tag == "welcome"
    # initSlick()
  # End of my code
  $('body').attr('data-loaded','T')

$(document).ready(ready)
$(document).on('turbolinks:load', ready)