# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title,
            :url,
            :rating,
            :consumed_on,
            presence: true
end
