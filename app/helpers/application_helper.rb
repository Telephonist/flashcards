# Helper for title;
module ApplicationHelper
  # Return base_title if page_title is empty;
  def full_title(page_title)
    base_title = 'Fleshcards'
    if page_title.empty?
      base_title
    else
      page_title
    end
  end
end
