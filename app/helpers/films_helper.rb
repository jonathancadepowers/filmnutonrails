# frozen_string_literal: true

module FilmsHelper
  def get_film_form_class(film_id_blank)
    film_id_blank ? "film-form-hidden" : "film-form-visible"
  end
end
