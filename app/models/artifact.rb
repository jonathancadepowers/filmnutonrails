# frozen_string_literal: true

class Artifact < ApplicationRecord
  validates :title, presence: true, format:
                                    { with: /\A[a-z0-9_]+\z/,
                                      message: "Lowercase only. No spaces." }
  has_one_attached :artifact_file
end
