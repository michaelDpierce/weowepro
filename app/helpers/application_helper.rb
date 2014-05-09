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

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id

    fields = f.fields_for(association, new_object, child_index: id) do |b|
      render(association.to_s.singularize + '_fields', f: b)
    end

    link_to name, '#',
            class: 'add_fields',
            data: {
              id: id,
              fields: fields.gsub("\n", '')
            }
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

  def admin_to_words(value)
    value == 'Manager' ? 'Yes' : 'No'
  end

  def phone_number_link(text)
    link_to text, "tel:#{text}"
  end

  def handle_action(resource, message, page)
    if yield(resource)
      handle_action_true(message, resource)
    else
      render page
    end
  end

  def handle_action_true(message, resource)
    flash[:success] = message
    redirect_to resource
  end

  def handle_dealer_action(resource, message, page)
    if yield(resource)
      handle_dealer_action_true(message, resource)
    else
      render page
    end
  end

  def handle_dealer_action_true(message, resource)
    flash[:success] = message
    redirect_to admin_path
  end

  def browser_check
    unless browser.modern?
      flash[:error] = "You are not using a browser that we support. " \
        'Please use IE9+, Chrome, Firefox, Safari, or another modern browser.'
    end
  end
end
