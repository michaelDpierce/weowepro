module ApplicationHelper

BASE_TITLE = 'WeOwePro'

  def full_title(page_title)
    if page_title.empty?
      BASE_TITLE
    else
      "#{BASE_TITLE} | #{page_title}"
    end
  end
end
