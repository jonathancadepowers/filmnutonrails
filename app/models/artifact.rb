# frozen_string_literal: true

class Artifact < ApplicationRecord
  validates :title, presence: true
  has_one_attached :artifact_file
end
