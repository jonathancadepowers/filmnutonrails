# frozen_string_literal: true

class TvShow < ApplicationRecord
  validates :title,
            :url,
            :rating,
            :consumed_on,
            presence: true
end
