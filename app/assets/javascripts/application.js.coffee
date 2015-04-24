#= require jquery
#= require jquery_ujs
#= require bootstrap-wysihtml5
#= require bootstrap-wysihtml5/locales
#= require_tree .

$(document).ready ->
  $('.wysihtml5').each (i, elem) ->
    $(elem).wysihtml5()
    return
  return
