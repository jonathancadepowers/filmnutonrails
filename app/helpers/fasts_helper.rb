# frozen_string_literal: true

module FastsHelper
  def title_fast(timestamp, time_fasted)
    title_values = { timestamp.to_date.strftime("%a, %b") => " ",
                     timestamp.to_date.day.ordinalize => ", ",
                     timestamp.to_date.strftime("%Y") => " - ",
                     ChronicDuration.output(time_fasted, format: :short) => "" }
    title_values.inject("") { |title, i| title + i[0] + i[1] }
  end
end
