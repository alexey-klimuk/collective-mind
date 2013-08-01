#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require foundation
#= require foundation-datepicker
#= require ./namespace
#= require ./notifications
#= require_directory ./pages

app = namespace('CollectiveMind')
notify = namespace('notify', app)
config = namespace('config', app)

# Configure flash notifications
# --------------------------------------------------------------------------
config.notifications =

  selectors:
    element : '.notification'
    error   : ['.error', '.failure', '.alert']
    warning : ['.warning']
    success : ['.success']
    notice  : ['.notice']



$ ->
  $(document).foundation()
