# frozen_string_literal: true

class FilmsController < StandardItemController
  skip_before_action :authenticate_user!, only: [:all]

  def all
    @all_films = Film.all.order("title ASC")
    @total_film_count = Film.count
    @films_grouped_by_ratings = build_rating_chart(Film)
    @films_grouped_by_release_year = Film.build_release_year_chart
    @films_grouped_by_director = Film.build_top_directors_chart
    @films_grouped_by_consumption_date = Film.build_watched_on_chart
    @films_grouped_by_dow_watched = Film.build_films_by_dow_chart
    @films_watched_this_year = consumed_this_year(Film)
    render layout: "main"
  end

  def create
    @film = Film.new(film_params)
    @display_timestamp = @film.consumed_on
    @film.save
    super
  end

  def destroy
    @film = Film.find(params[:id])
    super
  end

  def edit
    @film = Film.find(params[:id])
  end

  def index
    @all_films = Film.all.order("updated_at DESC")
  end

  def new
    @film = Film.new
  end

  def update
    @object = Film.find(params[:id])
    @object_result = @object.update(film_params)
    @display_timestamp = @object.consumed_on
    super
  end

  def tmdb_search
    results = TheMovieDb.tmdb_search(params[:title])
    data = results.map do |movie|
      { tmdb_id: movie["id"],
        title: movie["title"],
        year: movie["release_date"] }
    end
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
      :consumed_on,
      :directors,
      :release_year,
      :running_time
    )
  end
end
