# frozen_string_literal: true

module FilmsHelper
  def running_time_formatted(running_time)
    running_time.floor
  end
end
