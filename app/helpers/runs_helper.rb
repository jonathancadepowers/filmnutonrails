# frozen_string_literal: true

module RunsHelper
  def populate_run_time_in_form(run)
    if run.new_record?
      run.run_time
    else
      ChronicDuration.output(run.run_time, format: :chrono)
    end
  end

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

  def format_run_time_long(run_time)
    ChronicDuration.output(run_time, format: :long)
  end
end
