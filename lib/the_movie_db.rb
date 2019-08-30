# frozen_string_literal: true

class TheMovieDb
  Tmdb::Api.key(Rails.application.credentials.tmdb_api_key)

  def self.tmdb_search(title)
    search = Tmdb::Search.new
    search.resource("movie")
    search.query(title)
    search.fetch
  end

  def self.tmdb_get_directors(tmdb_id)
    credits = Tmdb::Movie.credits(tmdb_id)["crew"]
    # Filter out non-directors.
    directors = credits.select { |c| c["job"] == "Director" }
    # Return a comma+space separated list of director names.
    directors.collect { |d| d["name"] }.join(", ")
  end

  def self.tmdb_get_film_attributes(tmdb_id)
    movie = Tmdb::Movie.detail(tmdb_id)
    { "directors" => tmdb_get_directors(tmdb_id),
      "title" => movie["title"],
      "release_year" => movie["release_date"][0, 4],
      "running_time" => movie["runtime"],
      "imdb_url" => "https://www.imdb.com/title/" + movie["imdb_id"] }
  end
end
