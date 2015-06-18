module ApplicationHelper
	# Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Full Wines App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def after_sign_in_path_for user
    session[:forward_url] ? session.delete(:forward_url) : super
  end
end
