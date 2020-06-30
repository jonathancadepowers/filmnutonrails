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

  def smart_date_time_field_value(date_time_value)
    if date_time_value.nil?
      Time.zone.now.strftime("%Y-%m-%dT%H:%M")
    else
      date_time_value.strftime("%Y-%m-%dT%H:%M")
    end
  end

  def app_time_zone_as_string
    "America/Chicago"
  end

  def app_time_zone_as_zone
    ActiveSupport::TimeZone.new(app_time_zone_as_string)
  end

  def app_time_zone_offset
    current = TZInfo::Timezone.get(app_time_zone_as_string).current_period
    offset_in_hours = (current.utc_total_offset / 3600)
    if offset_in_hours.negative?
      format("%02d", (offset_in_hours * -1)).prepend("-") + ":00"
    else
      format("%02d", offset_in_hours).prepend("+") + ":00"
    end
  end
end
