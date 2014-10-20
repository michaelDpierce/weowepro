module ApplicationHelper
  BASE_TITLE = 'WeOwePro'

  def full_title(page_title)
    if page_title.empty?
      BASE_TITLE
    else
      "#{BASE_TITLE} | #{page_title}"
    end
  end

  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = :success if type == :notice
      type = :error   if type == :alert
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
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

  def handle_dealer_action_true(message, _resource)
    flash[:success] = message
    redirect_to admin_path
  end
end
