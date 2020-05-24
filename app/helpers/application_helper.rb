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

  def calculate_checked_state(object, current_value, desired_default)
    object.new_record? ? desired_default : current_value
  end

  def append_slash(counter_value, total_size, add_value)
    " / " unless counter_value + add_value == total_size
  end
end
