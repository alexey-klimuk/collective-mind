#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.CollectiveMind =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  initialize: ->
      new CollectiveMind.Routers.Application
      Backbone.history.start pushState: true


$(document).ready ->
  CollectiveMind.initialize()

$(document).on 'page:load', ->
  Backbone.history.stop()
  CollectiveMind.initialize()