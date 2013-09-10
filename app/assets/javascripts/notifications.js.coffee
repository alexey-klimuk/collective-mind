#= require pnotify/index


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

# Configure notifications: See https://github.com/sciactive/pnotify

notifications_stack =
  dir1: "down"
  dir2: "left"
  spacing1: 10
  spacing2: 10
  firstpos1: 20
  firstpos2: 20


$.extend($.pnotify.defaults,
  closer_hover: false
  closer: true
  styling: 'bootstrap'
  delay: 4000
  history: false
  stack: notifications_stack
  sticker: false
  width: null
  noblock: true
  noblock_opacity: .2
  shadow: true
  animation: 'fade'
)

display = (msg, opts) ->
  opts = $.extend(opts, pnotify_title: msg)
  $.pnotify(opts) if msg

app.notify =

  notice: (msg) ->
    display(msg,
      type: 'notice'
      addclass: 'notice'
      icon: 'general-enclosed foundicon-idea icon-notice'
      hide: false
    )

  error: (msg) ->
    display(msg,
      type: 'error'
      addclass: 'error'
      icon: 'general-enclosed foundicon-error icon-error'
      hide: false
    )

  warning: (msg) ->
    display(msg,
      type: 'info'
      addclass: 'warning'
      icon: 'general-enclosed foundicon-flag icon-warning'
      hide: false
    )

  success: (msg) ->
    display(msg,
      type: 'success'
      addclass: 'success'
      icon: 'general-enclosed foundicon-checkmark icon-success'
      hide: false
    )

app = namespace('CollectiveMind')
[config, notify] = namespace(['config','notify'], app)
$ ->
  # Initialize any notifications present in the DOM on page load
  $.each ['error', 'warning', 'success', 'notice'], (i,level) ->
    notif_sel = config.notifications.selectors
    notif_level_sel = notif_sel[level]
#    console.log("--------")
#    console.log(notif_level_sel)
#    console.log(level)
#    console.log(notif_sel)
#    console.log(notif_sel.element)
    # Notification selectors are composed of .[element class].[level class]
    notif_level_sel = $.map notif_level_sel, (sel) ->
      notif_sel.element + sel
    # Pull the message html out of hidden DOM elements
    notify[level]($(notif_level_sel.join(',')).html())
