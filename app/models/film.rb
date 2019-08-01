# frozen_string_literal: true

class Film < ApplicationRecord
  validates :title,
            :url,
            :rating,
            :watched_on,
            :directors,
            :release_year,
            :running_time,
            presence: true
end
