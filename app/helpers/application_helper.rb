module ApplicationHelper

  def view_nav_link(text, path)
    option = current_page?(path) ? { class: ["active", "nav-link"] } : { class: ["nav-link"]}
    content_tag(:a, link_to(text, path, option))
  end
end
