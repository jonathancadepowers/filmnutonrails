# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :author,
            :body,
            presence: true
  belongs_to :blog_post
end
