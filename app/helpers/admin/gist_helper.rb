module Admin::GistHelper
  def gist_url(hash)
    url = "https://gist.github.com/#{ hash }"

    link_to 'Gist', url, target: :blank
  end
end
