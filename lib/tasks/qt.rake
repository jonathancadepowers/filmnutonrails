require "uri"
require "rails-html-sanitizer.rb"

namespace :qt do
  desc "Commonly used troubleshooting and testing tasks."
	task qt: :environment do	
		
		foo = "1, 2, 3"
		puts foo.split(",").each do {
			
		}

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
