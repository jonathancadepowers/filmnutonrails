# frozen_string_literal: true

class TvShow < ApplicationRecord
  validates :title,
            :url,
            presence: true

  has_many :tv_show_seasons, dependent: :nullify
end
