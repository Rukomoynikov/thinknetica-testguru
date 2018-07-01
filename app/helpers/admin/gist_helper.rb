module Admin::GistHelper
  def gist_url(hash)
    url = "https://gist.github.com/#{ hash }"

    "<a href='#{ url }'>Gist</a>".html_safe
  end
end
