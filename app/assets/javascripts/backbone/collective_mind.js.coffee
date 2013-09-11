#= require_self
#= require_tree ./templates

app = namespace('CollectiveMind')
[models, collections, views, routers] = namespace(['models','collections', 'views', 'routers'], app)

