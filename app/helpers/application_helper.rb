module ApplicationHelper
  def full_title page_title = ""
    base_title = t "title"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def paginate objects, options = {}
    options.reverse_merge! theme: "twitter-bootstrap-3"
    super objects, options
  end
end
