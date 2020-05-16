# frozen_string_literal: true

class Artifact < ApplicationRecord
  validates :title, presence: true, format:
                                    { with: /\A[a-z0-9_]+\z/,
                                      message: "Lowercase only. No spaces." }
  has_one_attached :artifact_file

  validate :check_file_presence

  def check_file_presence
    if artifact_file.attached? == false
    else
      errors.add(:artifact_file, "A file must be uploaded.")
    end
  end
end
