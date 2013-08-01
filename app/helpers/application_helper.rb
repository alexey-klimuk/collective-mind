module ApplicationHelper

  def rails_controller_css_class
    "#{controller.controller_name.dasherize}-page"
  end

  def title(name='')
    "#{name} " + Rails.application.class.parent_name.to_s
  end

  # Allows views to include their own CSS in the <head>
  def css
    if block_given?
      content_for(:css) { yield }
    else
      content_for :css
    end
  end

  # Allows views to include their own js at the end of the <body>
  def js
    if block_given?
      content_for(:js) { yield }
    else
      content_for :js
    end
  end

  # Allows views to include their own js in the <head>
  def head_js
    if block_given?
      content_for(:head_js) { yield }
    else
      content_for :head_js
    end
  end

  def page_js
    if block_given?
      content_for(:page_js) { yield }
    else
      content_for :page_js
    end
  end

  def count(c)
    number_to_human(c, units: :count, precision: 4, separator: ',')
  end

end
