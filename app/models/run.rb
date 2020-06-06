# frozen_string_literal: true

class Run < ApplicationRecord
  validates :miles,
            :location,
            presence: true

  belongs_to :life_log
end
