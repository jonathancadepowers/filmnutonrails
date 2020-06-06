# frozen_string_literal: true

class Run < ApplicationRecord
  validates :miles,
            :run_time,
            :location,
            presence: true

  belongs_to :life_log
end
