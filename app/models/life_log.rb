# frozen_string_literal: true

class LifeLog < ApplicationRecord
  has_one :blog_post, dependent: :nullify
  has_one :film, dependent: :nullify
  has_one :tv_show, dependent: :nullify
  has_one :book, dependent: :nullify
  has_one :run, dependent: :nullify

  validates :display_timestamp,
            :related_object_type,
            presence: true

  def self.life_logs_set(count)
    LifeLog.all
           .limit(count)
           .order("display_timestamp DESC")
           .group_by_day(&:display_timestamp)
           .group_by_month { |d| d[0] }
           .reverse_each
  end

  def self.life_logs_set_single_day(day)
    day_start = DateTime.strptime(day, "%Y%m%d").in_time_zone(Time.zone).beginning_of_day
    day_end = DateTime.strptime(day, "%Y%m%d").in_time_zone(Time.zone).end_of_day
    LifeLog.where(display_timestamp: day_start..day_end)
           .order("display_timestamp DESC")
           .group_by_day(&:display_timestamp)
           .group_by_month { |d| d[0] }
           .reverse_each
  end
end
