# frozen_string_literal: true

module RunsHelper
  def build_title(full_title, append_value)
    full_title + append_value
  end

  def title_run(timestamp, miles, run_time)
    title_values = { timestamp.to_date.strftime("%a, %b") => " ",
                     timestamp.to_date.day.ordinalize => ", ",
                     timestamp.to_date.strftime("%Y") => " - ",
                     miles.to_s => " - ",
                     ChronicDuration.output(run_time, format: :short) => "" }
    title_values.inject("") { |title, i| title + i[0] + i[1] }
  end
end
