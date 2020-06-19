require "uri"
require "rails-html-sanitizer.rb"

namespace :qt do
  desc "Commonly used troubleshooting and testing tasks."
	task qt: :environment do

		all_life_logs = LifeLog.all
		all_life_logs.each do |ll|
			
			if ll.related_object_type == "tv_show"
				ll.destroy
			end
		end
				
	end

	task :migrate_tv_shows, [:show_id, :seasons, :year, :month, :day, :rating] => :environment do |t, args|
		show = TvShow.find(args[:show_id])
		seasons = args[:seasons].to_i
		consumed_on = DateTime.new(args[:year].to_i,args[:month].to_i,args[:day].to_i)
		rating = args[:rating].to_i

		seasons.times do |season_number|
			season_number = season_number + 1
			tv_show_season = TvShowSeason.new
			tv_show_season[:title] = "Season " + season_number.to_s
			tv_show_season[:consumed_on] = consumed_on
			tv_show_season[:tv_show_id] = show.id
			tv_show_season[:season_title] = "#{show.title} - Season #{season_number.to_s}"
			tv_show_season[:rating] = rating
			puts tv_show_season.create_life_log(display_timestamp: consumed_on, related_object_type: "tv_show_season")
			puts tv_show_season.save
			puts "-----"
		end
	end

	task get_object_by_attribute: :environment do

		film = Film.where(title: ["Dogtooth"])
		puts film.inspect

	end

  task create_film: :environment do

  	Film.create(
  		title: "Gone with the Wind",
  		url: "https://www.imdb.com/title/tt0031381/",
  		rating: 5,
		consumed_on: Time.zone.now.to_date,
		directors: "Victor Fleming",
		release_year: 1939,
		running_time: 238)

	end
	
	task create_comment: :environment do

		blog_post = BlogPost.find(57)
		puts blog_post.comments.create(
			author: "SRobinson",
			body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur aliquet euismod justo, nec bibendum nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vestibulum ac augue non congue. Sed in odio ac orci commodo imperdiet a vel dui. Morbi in mi ac felis congue ullamcorper. In quis porta nulla, ut ultricies magna. Vivamus suscipit risus est, aliquet mollis turpis pharetra a."
		)

	end

	task reset_admin: :environment do

		user = User.find(7)
		user.pending_approval = true
		user.save

	end

end
