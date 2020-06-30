# frozen_string_literal: true

class LifeLog < ApplicationRecord
  include LifeLogable

  has_one :blog_post, dependent: :nullify
  has_one :film, dependent: :nullify
  has_one :tv_show_season, dependent: :nullify
  has_one :book, dependent: :nullify
  has_one :run, dependent: :nullify
  has_one :podcast_episode, dependent: :nullify
  has_one :tunes_summary, dependent: :nullify

  validates :display_timestamp,
            :related_object_type,
            presence: true

  # Converts life logs to app's default time zone before grouping them.
  def self.life_logs_set(count)
    local_time_zone = ApplicationController.helpers.app_time_zone_as_zone
    LifeLog.all
           .limit(count)
           .order("display_timestamp DESC")
           .group_by_day(time_zone: local_time_zone, &:display_timestamp)
           .reverse_each
           .group_by_month(time_zone: local_time_zone) { |d| d[0] }
           .reverse_each
  end

  # Converts life logs to the app's default time zone before grouping them.
  def self.life_logs_set_single_day(day)
    local_time_zone = ApplicationController.helpers.app_time_zone_as_zone
    local_offset = ApplicationController.helpers.app_time_zone_offset
    day_beg = LifeLogable.local_to_utc_boundary(day, "beginning", local_offset)
    day_end = LifeLogable.local_to_utc_boundary(day, "end", local_offset)
    LifeLog.where(display_timestamp: day_beg..day_end)
           .order("display_timestamp DESC")
           .group_by_day(time_zone: local_time_zone, &:display_timestamp)
           .group_by_month(time_zone: local_time_zone) { |d| d[0] }
           .reverse_each
  end
end
