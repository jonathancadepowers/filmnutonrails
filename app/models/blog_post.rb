# frozen_string_literal: true

require "acts-as-taggable-on"

class BlogPost < ApplicationRecord
  validates :title,
            :body,
            presence: true

  has_many :comments, dependent: :nullify

  belongs_to :life_log

  acts_as_taggable_on :tags

  def self.posts_by_year
    local_zone = ApplicationController.helpers.app_time_zone_as_string
    BlogPost.group_by_year(:created_at, time_zone: local_zone)
            .count.select { |_year, count| count.positive? }
            .transform_keys { |key| key.strftime("%Y") }
  end
end
