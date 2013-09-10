#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views

app = namespace('CollectiveMind')
[models, collections, views, routers] = namespace(['models','collections', 'views', 'routers'], app)

