# frozen_string_literal: true

module LifeLogsHelper
  def extract_month_header(single_month_in_life_log)
    single_month_in_life_log[0].strftime("%B %Y").upcase
  end

  def extract_days_from_month_set(single_month_in_life_log)
    single_month_in_life_log[1]
  end

  def extract_month_label(single_day_in_life_log)
    single_day_in_life_log[0].strftime("%b")
  end

  def extract_day_label(single_day_in_life_log)
    single_day_in_life_log[0].strftime("%d")
  end

  def extract_day_of_week_label(single_day_in_life_log)
    single_day_in_life_log[0].strftime("%a").upcase
  end

  def extract_life_log_marker(single_life_log)
    if single_life_log.related_object_type == "podcast_episode"
      "PODCAST"
    elsif single_life_log.related_object_type == "tunes_summary"
      "MUSIC"
    else
      single_life_log.related_object_type.tr("_", " ").upcase
    end
  end

  def extract_life_logs_from_day(single_day_in_life_log)
    single_day_in_life_log[1]
  end

  def extract_perm_link_url(single_day_in_life_log)
    "/life_logs/" + single_day_in_life_log[0].strftime("%Y%m%d")
  end

  def determine_life_log_partial(single_life_log)
    "single_" + single_life_log.related_object_type + "_in_life_log"
  end

  def extract_related_object_from_single_life_log(single_life_log)
    single_life_log.public_send(single_life_log.related_object_type)
  end

  def format_run_location(location)
    locations = { "Home - Peloton" => "on my home Peloton",
                  "Hotel - Treadmill" => "on a treadmill at a hotel" }
    locations[location]
  end

  def podcast_episode_google_search_url(podcast_title, episode_title)
    "https://www.google.com/search?q=podcast /
    " + podcast_title + "+" + episode_title
  end

  def tunes_summary_display(tunes_summary_filtered)
    tunes_summary_filtered.collect do |v|
      "<li>#{v[0]} - #{v[1]} songs</li>"
    end.join("")
  end
end
