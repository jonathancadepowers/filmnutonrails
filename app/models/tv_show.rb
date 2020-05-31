# frozen_string_literal: true

class TvShow < ApplicationRecord
  validates :title,
            :url,
            :rating,
            :consumed_on,
            presence: true

  belongs_to :life_log
end
