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

  # Sets a field's default value, respecting "new" versus "edit" actions.
  def default_form_value(object, value_if_new, value_if_not_new)
    object.new_record? ? value_if_new : value_if_not_new
  end

  def smart_date_field_value(date_value)
    if date_value.nil?
      Time.zone.now.strftime("%Y-%m-%d")
    else
      date_value.strftime("%Y-%m-%d")
    end
  end
end
