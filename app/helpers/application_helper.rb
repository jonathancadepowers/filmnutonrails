# frozen_string_literal: true

module ApplicationHelper
  def return_xss_safe_url(url)
    scheme = URI(url).scheme
    if (scheme == "http") || (scheme == "https")
      url
    else
      "#"
    end
  end

  def sanitize_link(link)
    full_sanitizer = Rails::Html::FullSanitizer.new
		full_sanitizer.sanitize(link)
  end
end
