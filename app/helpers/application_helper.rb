module ApplicationHelper
  BOOTSTRAP_ALERT_CLASSES = {
    success: 'alert-success',
    error: 'alert-danger',
    alert: 'alert-warning',
    notice: 'alert-info'
  }

  BASE_TITLE = 'WeOwePro'

  def full_title(page_title)
    if page_title.empty?
      BASE_TITLE
    else
      "#{BASE_TITLE} | #{page_title}"
    end
  end

  def flash_messages(opts = {})
    content_tag   :div, class: 'row' do
      content_tag :div, class: 'col-md-8 col-md-offset-2' do
        flash_html.join.html_safe
      end
    end
  end

  def flash_html
    flash.map do |msg_type, message|
      content_tag :div, message,
                  class: "alert #{bootstrap_class_for(msg_type)}"
    end
  end

  def bootstrap_class_for(flash_type)
    BOOTSTRAP_ALERT_CLASSES[flash_type] || flash_type.to_s
  end

  def boolean_to_words(value)
    value ? 'Yes' : 'No'
  end

  def handle_action(resource, message, page)
    if yield(resource)
      handle_action_true
    else
      render page
    end
  end

  def handle_action_true
    flash[:success] = message
    redirect_to resource
  end
end
