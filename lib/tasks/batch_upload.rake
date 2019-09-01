namespace :batch_upload do
  desc "Parses a CSV of films and ingests them into the app's database."
  task upload_films: :environment do

  	films = CSV.foreach("/Users/jpowers/desktop/sites/filmnut/lib/tasks/files/film_export.csv", headers:true) do |row|

  	  puts "Processing \"" + row["film"] + "\""  

  	  new_film = Film.new
  	  
  	  new_film.title = row["film"]
  	  new_film.url = row["imdb_url"]
  	  new_film.rating = row["rating"]
  	  new_film.consumed_on = Time.at(row["timestamp"].to_i).to_datetime
  	  new_film.directors = row["directors"]
  	  new_film.release_year = row["release_year"]
  	  new_film.running_time = row["running_time"]

  	  new_film.save

  	  puts "Done!"

  	end

  end

end
