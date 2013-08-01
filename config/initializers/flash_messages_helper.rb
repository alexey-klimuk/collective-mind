require 'flash_messages_helper'

FlashMessagesHelper.configure do |config|

  config.dom_id = lambda do |type|
    "#{type}-notification"
  end

  config.css_class = lambda do |type|
    "#{type} notification"
  end

  config.wrapper = :div

end