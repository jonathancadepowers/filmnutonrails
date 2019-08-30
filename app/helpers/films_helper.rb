# frozen_string_literal: true

module FilmsHelper
  def running_time_formatted(running_time)
    running_time.floor
  end

  def get_film_form_class(film_id_blank)
    film_id_blank ? "film-form-hidden" : "film-form-visible"
  end
end
