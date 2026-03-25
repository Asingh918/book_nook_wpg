module ApplicationHelper
  def breadcrumbs(*crumbs)
    content_tag :nav, style: "margin-bottom:16px; font-size:13px; color:#666;" do
      crumbs.map.with_index do |crumb, i|
        if i < crumbs.length - 1
          link_to(crumb[:name], crumb[:path], style: "color:#2d6a4f; text-decoration:none;") + content_tag(:span, " › ", style: "margin:0 6px; color:#999;")
        else
          content_tag(:span, crumb[:name], style: "color:#333;")
        end
      end.join.html_safe
    end
  end
end
