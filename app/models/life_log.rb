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

  def self.life_logs_set(count)
    local_time_zone = ApplicationController.helpers.app_time_zone
    LifeLog.all
           .limit(count)
           .order("display_timestamp DESC")
           .group_by_day(time_zone: local_time_zone, &:display_timestamp)
           .reverse_each
           .group_by_month(time_zone: local_time_zone) { |d| d[0] }
           .reverse_each
  end

  def self.life_logs_set_single_day(day)
    local_time_zone = ApplicationController.helpers.app_time_zone
    local_offset = ApplicationController.helpers.app_time_zone_offset
    day_start = LifeLogable.get_day_boundary(day, "beginning")
                           .change(offset: local_offset)
                           .in_time_zone(Time.zone)
    day_end = LifeLogable.get_day_boundary(day, "end")
                         .change(offset: local_offset)
                         .in_time_zone(Time.zone)
    LifeLog.where(display_timestamp: day_start..day_end)
           .order("display_timestamp DESC")
           .group_by_day(time_zone: local_time_zone, &:display_timestamp)
           .group_by_month(time_zone: local_time_zone) { |d| d[0] }
           .reverse_each
  end
end
