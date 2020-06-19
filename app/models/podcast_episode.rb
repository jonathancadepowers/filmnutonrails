# frozen_string_literal: true

class PodcastEpisode < ApplicationRecord
  belongs_to :podcast
  accepts_nested_attributes_for :podcast
  belongs_to :life_log
  attr_accessor :create_new_podcast_option
  validates :title,
            :consumed_on,
            :episode_title,
            presence: true
end
