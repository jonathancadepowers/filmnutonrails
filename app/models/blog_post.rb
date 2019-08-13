# frozen_string_literal: true

class BlogPost < ApplicationRecord
  validates :title,
            :body,
            presence: true
  has_many :comments, dependent: :nullify
end
