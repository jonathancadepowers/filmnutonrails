# frozen_string_literal: true

require "acts-as-taggable-on"

class BlogPost < ApplicationRecord
  validates :title,
            :body,
            presence: true
  has_many :comments, dependent: :nullify
  acts_as_taggable_on :tags

  def self.posts_by_year
    BlogPost.group_by_year(:created_at)
            .count.select { |_year, count| count.psotive? }
            .transform_keys { |key| key.strftime("%Y") }
  end
end
