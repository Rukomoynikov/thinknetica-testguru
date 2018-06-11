module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{ author }/#{ repo }"
  end

  def flash_message
    content_tag :p, flash[:alert], class: 'flash flash--alert' if flash[:alert]
  end
end
