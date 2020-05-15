namespace :batch_upload do
  desc "Parses a CSV of films and ingests them into the app's database."
  task upload_films: :environment do

  	items = CSV.foreach("/Users/jpowers/desktop/film.csv", headers:true) do |row|

  	  puts "Processing \"" + row["film"] + "\""

  	  new_film = Film.new
  	  
  	  new_film.title = row["film"]
  	  new_film.url = row["imdb_url"]
  	  new_film.rating = row["rating"]
			new_film.consumed_on = Time.at(row["timestamp"].to_i).to_datetime
			new_film.created_at = Time.at(row["timestamp"].to_i).to_datetime
  	  new_film.directors = row["directors"]
  	  new_film.release_year = row["release_year"]
  	  new_film.running_time = row["running_time"]

  	  new_film.save!

  	  puts "Done!"

  	end

	end
	
	task upload_tv_shows: :environment do

  	items = CSV.foreach("/Users/jpowers/desktop/tv.csv", headers:true) do |row|

  	  puts "Processing \"" + row["show"] + "\"" 

			new_tv_show = TvShow.new
			
			new_tv_show.title = row["show"]
			new_tv_show.url = row["link"]
			new_tv_show.rating = row["rating"]
			new_tv_show.consumed_on = Time.at(row["timestamp"].to_i).to_datetime
			new_tv_show.created_at = Time.at(row["timestamp"].to_i).to_datetime 	  

  	  new_tv_show.save!

  	  puts "Done!"

  	end

	end
	
	task upload_books: :environment do

  	items = CSV.foreach("/Users/jpowers/desktop/lit.csv", headers:true) do |row|

  	  puts "Processing \"" + row["book"] + "\"" 

			new_book = Book.new
			
			new_book.title = row["book"]
			new_book.url = row["link"]
			new_book.rating = row["rating"]
			new_book.consumed_on = Time.at(row["timestamp"].to_i).to_datetime
			new_book.created_at = Time.at(row["timestamp"].to_i).to_datetime 	  

  	  puts new_book.save!

  	  puts "Done!"

  	end

	end
	
	task upload_blog_posts: :environment do

  	items = CSV.foreach("/Users/jpowers/desktop/blog.csv", headers:true, liberal_parsing: true) do |row|

  	  # puts "Processing \"" + row["id"] + "\"" 

			# new_blog_post = BlogPost.new
			
			# new_blog_post.title = row["title"]
			# new_blog_post.body = row["body"]
			# new_blog_post.created_at = Time.at(row["timestamp"].to_i).to_datetime

  	  # new_blog_post.save!

  	  # puts "Done!"

  	end

  end

end
