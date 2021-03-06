# frozen_string_literal: true

require "rubygems" # TODO: Is this needed?

class Film < ApplicationRecord
  include Reportable

  validates :title,
            :url,
            :rating,
            :consumed_on,
            :directors,
            :release_year,
            :running_time,
            presence: true

  belongs_to :life_log

  def self.build_release_year_chart
    Film.group(:release_year).order("release_year desc").count
  end

  def self.build_top_directors_chart
    data = Film.group(:directors)
               .order("count_all desc")
               .limit(50)
               .count
               .transform_keys do |key|
      key.length > 17 ? NameOfPerson::PersonName.full(key).abbreviated : key
    end
    data.to_a.reverse
  end

  def self.build_watched_on_chart
    local_zone = ApplicationController.helpers.app_time_zone_as_string
    data = Film.group_by_year(:consumed_on, time_zone: local_zone)
               .count
               .transform_keys do |key|
      key.year.to_s
    end
    data.delete("2008")
    data
  end

  def self.build_films_by_dow_chart
    local_zone = ApplicationController.helpers.app_time_zone_as_string
    Film.where("consumed_on > ?", DateTime.new(2008, 9, 5, 0, 0, 0))
        .group_by_day_of_week(:consumed_on, time_zone: local_zone)
        .count.transform_keys do |key|
      Date::DAYNAMES[key]
    end
  end
end
