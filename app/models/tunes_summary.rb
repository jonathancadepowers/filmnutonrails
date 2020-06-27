# frozen_string_literal: true

class TunesSummary < ApplicationRecord
  validates :summary_date,
            :artists_and_tracks,
            presence: true

  belongs_to :life_log, optional: true
end
