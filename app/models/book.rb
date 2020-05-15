# frozen_string_literal: true

class Book < ApplicationRecord
  include Reportable
  validates :title,
            :authors,
            :url,
            :rating,
            :consumed_on,
            presence: true
end
