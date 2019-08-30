# frozen_string_literal: true

class FilmsController < ApplicationController
  def create
    @film = Film.new(film_params)
    super # Parent method lives in ApplicationController.
  end

  def destroy
    @film = Film.find(params[:id])
    super # Parent method lives in ApplicationController.
  end

  def edit
    @film = Film.find(params[:id])
  end

  def index
    @all_films = Film.all.order("watched_on DESC")
  end

  def new
    @film = Film.new
  end

  def update
    @result = Film.find(params[:id]).update(film_params)
    super # Parent method lives in ApplicationController.
  end

  def tmdb_search
    results = TheMovieDb.tmdb_search(params[:title])
    data = results.map { |movie| { tmdb_id: movie["id"], title: movie["title"], year: movie["release_date"] } }
    render json: data
  end

  def tmdb_get_film_attributes
    render json: TheMovieDb.tmdb_get_film_attributes(params[:tmdb_id])
  end

  private

  def film_params
    params.require(:film).permit(
      :title,
      :url,
      :rating,
      :watched_on,
      :directors,
      :release_year,
      :running_time
    )
  end
end
