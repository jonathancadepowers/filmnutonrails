# frozen_string_literal: true

class TvShow < ApplicationRecord
  validates :title,
            :url,
            :rating,
            :watched_on,
            presence: true
end
