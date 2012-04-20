module ApplicationHelper
  def markdown(text)
    options ||= [
      hard_wrap:            true, 
      filter_html:          true, 
      gh_blockcode:         true,
      space_after_headers:  true, 
      fenced_code_blocks:   true, 
      autolink:             true, 
      no_intra_emphasis:    true
      ]
    redcarpet = Redcarpet::Markdown.new(Redcarpet::Render::HTML, *options)
    redcarpet.render(text).html_safe
  end
end
