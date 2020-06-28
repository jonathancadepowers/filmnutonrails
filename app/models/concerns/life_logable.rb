# frozen_string_literal: true

module LifeLogable
  extend ActiveSupport::Concern

  # Ensures that an Apples to Apples query is executed.
  # .change converts "day" to the correct context: the app's default time zone.
  # .in_time_zone then converts "day" to UTC, since life logs are stored in UTC.
  # Example: "2020-01-01" => 2020-01-01 06:00:00 UTC
  def self.local_day_to_utc_boundary(day, boundary, local_offset)
    Date.strptime(day, "%Y%m%d")
        .public_send(boundary + "_of_day")
        .change(offset: local_offset)
        .in_time_zone(Time.zone)
  end
end
