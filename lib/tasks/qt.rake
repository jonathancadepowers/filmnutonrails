namespace :qt do
  desc "TODO"
  task qt: :environment do

  	puts new_film_path

  end

  task create_film: :environment do

  	Film.create(
  		title: "Gone with the Wind",
  		url: "https://www.imdb.com/title/tt0031381/",
  		rating: 5,
		watched_on: Time.zone.now.to_date,
		directors: "Victor Fleming",
		release_year: 1939,
		running_time: 238)

  end

end

# Common Tasks
# --------------------

# Film.all.each do |film|
	
# 	TODO

# end