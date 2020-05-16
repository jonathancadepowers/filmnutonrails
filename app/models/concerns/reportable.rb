# frozen_string_literal: true

module Reportable
  extend ActiveSupport::Concern

  def build_rating_chart(object_to_chart)
    object_to_chart.group(:rating).count.transform_keys do |key|
      key == 1 ? (key.to_s + " Star") : (key.to_s + " Stars")
    end
  end

  def consumed_this_year(object_to_chart)
    object_to_chart.where("consumed_on > ? and consumed_on < ?",
                          Time.zone.today.at_beginning_of_year,
                          Time.zone.today.at_end_of_year).count
  end

  def last_n_consumed(object_to_report, count)
    object_to_report.all.order("consumed_on desc").limit(count)
  end
end
