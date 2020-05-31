# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Reportable
  def hydrate_sidebar_data
    @last_10_films_consumed = last_n_consumed(Film, 10)
    @last_10_shows_consumed = last_n_consumed(TvShow, 10)
    @last_10_books_consumed = last_n_consumed(Book, 10)
  end
end
