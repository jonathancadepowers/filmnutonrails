# frozen_string_literal: true

class TvShowSeason < ApplicationRecord
  belongs_to :life_log
  belongs_to :tv_show
  accepts_nested_attributes_for :tv_show
  attr_accessor :create_new_tv_show_option
  validates :title,
            :rating,
            :consumed_on,
            :season_title,
            presence: true
end
