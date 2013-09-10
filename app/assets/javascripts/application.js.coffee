#= require jquery
#= require jquery_ujs
#= require underscore
#= require backbone
#= require turbolinks
#= require foundation
#= require foundation-datepicker
#= require ./namespace
#= require ./notifications
#= require_directory ./pages
#= require ./backbone/collective_mind

app = namespace('CollectiveMind')

$ ->
  $(document).foundation()
