# frozen_string_literal: true

class Fast < ApplicationRecord
  validates :time_fasted,
            presence: true

  belongs_to :life_log
end
