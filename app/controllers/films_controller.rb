# frozen_string_literal: true

class FilmsController < StandardItemController
  def create
    @film = Film.new(film_params)
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
    @film = Film.find(params[:id])
    @result = @film.update(film_params)
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
