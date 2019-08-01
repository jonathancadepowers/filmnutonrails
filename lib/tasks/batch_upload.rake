namespace :batch_upload do
  desc "TODO"
  task upload_films: :environment do

  	films = CSV.foreach("/Users/jpowers/desktop/sites/filmnut/lib/tasks/files/film_export.csv", headers:true) do |row|

  	  puts "Processing \"" + row["film"] + "\""  

  	  new_film = Film.new
  	  
  	  new_film.title = row["film"]
  	  new_film.url = row["imdb_url"]
  	  new_film.rating = row["rating"]
  	  new_film.watched_on = Time.at(row["timestamp"].to_i).to_datetime
  	  new_film.directors = row["directors"]
  	  new_film.release_year = row["release_year"]
  	  new_film.running_time = row["running_time"]

  	  new_film.save

  	  puts "Done!"

  	end

  end

end
