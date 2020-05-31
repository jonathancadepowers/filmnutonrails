# frozen_string_literal: true

class LifeLog < ApplicationRecord
  has_one :blog_post, dependent: :nullify
  has_one :film, dependent: :nullify
  has_one :tv_show, dependent: :nullify
  has_one :book, dependent: :nullify

  validates :display_timestamp,
            :related_object_type,
            presence: true

  def self.life_logs_set(count)
    LifeLog.all
           .limit(count)
           .order("display_timestamp DESC")
           .group_by_day(&:display_timestamp)
           .reverse_each
  end

  def self.life_logs_set_single_day(day)
    day_start = Date.strptime(day, "%Y%m%d").beginning_of_day
    day_end = Date.strptime(day, "%Y%m%d").end_of_day
    LifeLog.where(display_timestamp: day_start..day_end)
           .order("display_timestamp DESC")
           .group_by_day(&:display_timestamp)
           .reverse_each
  end
end
