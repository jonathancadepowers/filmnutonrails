# frozen_string_literal: true

class Podcast < ApplicationRecord
  has_many :podcast_episodes, dependent: :nullify
  validates :title,
            :url,
            presence: true
end
