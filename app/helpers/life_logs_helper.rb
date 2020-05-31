# frozen_string_literal: true

module LifeLogsHelper
  def extract_month(single_day_in_life_log)
    single_day_in_life_log[0].strftime("%b")
  end

  def extract_day(single_day_in_life_log)
    single_day_in_life_log[0].strftime("%d")
  end

  def extract_day_of_week(single_day_in_life_log)
    single_day_in_life_log[0].strftime("%a").upcase
  end

  def extract_life_log_marker(single_life_log)
    single_life_log.related_object_type.tr("_", " ").upcase
  end

  def extract_life_logs(single_day_in_life_log)
    single_day_in_life_log[1]
  end

  def extract_perm_link_url(single_day_in_life_log)
    "/life_logs/" + single_day_in_life_log[0].strftime("%Y%m%d")
  end

  def determine_life_log_partial(single_life_log)
    "single_" + single_life_log.related_object_type + "_in_life_log"
  end

  def extract_related_object(single_life_log)
    single_life_log.public_send(single_life_log.related_object_type)
  end
end
