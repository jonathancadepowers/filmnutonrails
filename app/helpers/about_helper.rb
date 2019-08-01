# frozen_string_literal: true

module AboutHelper
  def film_count_formatted(film_count)
    number_with_delimiter(film_count, delimiter: ",")
  end

  def calculate_jp_age
    birthday = Date.parse("13-11-1981")
    today = Time.zone.now.to_date
    age = today - birthday
    number_with_delimiter(age.to_i, delimiter: ",")
  end
end
