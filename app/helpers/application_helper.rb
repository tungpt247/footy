module ApplicationHelper
  def title page_title
    content_for(:title) { page_title }
  end
  def is_logged_in
    current_user
  end
  def year
    2015
  end
  def author
    'tungphan'
  end
end
