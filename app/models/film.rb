# frozen_string_literal: true

class Film < ApplicationRecord
  validates :title,
            :url,
            :rating,
            :consumed_on,
            :directors,
            :release_year,
            :running_time,
            presence: true
end
