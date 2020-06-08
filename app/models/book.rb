# frozen_string_literal: true

class Book < ApplicationRecord
  include Reportable # TODO: Move this "include" into ApplicationRecord?
  validates :title,
            :authors,
            :url,
            :rating,
            :consumed_on,
            presence: true

  belongs_to :life_log
end
