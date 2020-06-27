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
    LifeLog.all
           .limit(count)
           .order("display_timestamp DESC")
           .group_by_day(&:display_timestamp)
           .reverse_each
           .group_by_month { |d| d[0] }
           .reverse_each
  end

  def self.life_logs_set_single_day(day)
    day_start = LifeLogable.get_day_boundary(day, "beginning")
    day_end = LifeLogable.get_day_boundary(day, "end")
    LifeLog.where(display_timestamp: day_start..day_end)
           .order("display_timestamp DESC")
           .group_by_day(&:display_timestamp)
           .group_by_month { |d| d[0] }
           .reverse_each
  end
end
