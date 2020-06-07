# frozen_string_literal: true

module LifeLogable
  extend ActiveSupport::Concern

  def self.get_day_boundary(day, boundary)
    Date.strptime(day, "%Y%m%d").public_send(boundary + "_of_day")
  end
end
