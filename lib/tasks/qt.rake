require "uri"
require "rails-html-sanitizer.rb"

namespace :qt do
  desc "Commonly used troubleshooting and testing tasks."
	task qt: :environment do

		def migrate_tv_shows(show_id,seasons,year,month,day,rating)
			show = TvShow.find(show_id)
			seasons = seasons
			consumed_on = DateTime.new(year,month,day)
			rating = rating

			seasons.times do |season_number|
				season_number = season_number + 1
				tv_show_season = TvShowSeason.new
				tv_show_season[:title] = "#{show.title} - Season #{season_number.to_s}"
				tv_show_season[:consumed_on] = consumed_on
				tv_show_season[:tv_show_id] = show.id
				tv_show_season[:season_title] = "Season " + season_number.to_s
				tv_show_season[:rating] = rating
				puts tv_show_season.create_life_log(display_timestamp: consumed_on, related_object_type: "tv_show_season")
				puts tv_show_season.save
				puts "-----"
			end
		end

		migrate_tv_shows(3,3,2008,9,4,4)
		migrate_tv_shows(4,2,2008,9,4,3)
		migrate_tv_shows(5,3,2009,10,19,3)
		migrate_tv_shows(6,4,2010,12,11,3)
		migrate_tv_shows(7,9,2008,9,4,4)
		migrate_tv_shows(8,7,2009,12,6,3)
		migrate_tv_shows(9,6,2008,9,4,5)
		migrate_tv_shows(10,3,2008,9,4,3)
		migrate_tv_shows(11,4,2011,6,15,3)
		migrate_tv_shows(12,1,2009,4,17,5)
		migrate_tv_shows(13,1,2008,9,4,3)
		migrate_tv_shows(14,4,2008,9,4,4)
		migrate_tv_shows(15,2,2009,4,7,4)
		migrate_tv_shows(16,2,2008,9,4,5)
		migrate_tv_shows(17,7,2011,10,11,3)
		migrate_tv_shows(19,2,2008,9,4,2)
		migrate_tv_shows(20,2,2008,9,4,3)
		migrate_tv_shows(22,1,2008,9,4,3)
		migrate_tv_shows(23,7,2009,3,13,3)
		migrate_tv_shows(24,2,2008,12,26,1)
		migrate_tv_shows(25,1,2008,9,4,3)
		migrate_tv_shows(26,4,2011,3,19,4)
		migrate_tv_shows(27,1,2008,9,4,3)
		migrate_tv_shows(28,1,2008,9,4,2)
		migrate_tv_shows(29,1,2008,9,4,5)
		migrate_tv_shows(30,3,2008,9,4,4)
		migrate_tv_shows(31,3,2008,9,4,4)
		migrate_tv_shows(32,2,2008,11,1,5)
		migrate_tv_shows(33,7,2009,8,12,4)
		migrate_tv_shows(34,2,2009,4,3,4)
		migrate_tv_shows(35,3,2007,3,20,5)
		migrate_tv_shows(36,5,2008,9,4,5)
		migrate_tv_shows(37,9,2008,9,4,3)
		migrate_tv_shows(38,2,2009,6,9,4)
		migrate_tv_shows(39,5,2009,8,12,3)
		migrate_tv_shows(40,3,2008,9,12,3)
		migrate_tv_shows(41,1,2008,10,27,3)
		migrate_tv_shows(42,1,2008,11,1,3)
		migrate_tv_shows(43,7,2017,5,14,5)
		migrate_tv_shows(44,1,2008,12,14,3)
		migrate_tv_shows(45,2,2008,12,20,3)
		migrate_tv_shows(46,3,2009,1,20,4)
		migrate_tv_shows(47,1,2008,12,30,3)
		migrate_tv_shows(48,2,2009,9,26,4)
		migrate_tv_shows(49,9,2009,1,24,4)
		migrate_tv_shows(50,3,2009,1,25,3)
		migrate_tv_shows(51,1,2009,2,10,2)
		migrate_tv_shows(52,2,2009,3,9,3)
		migrate_tv_shows(53,1,2009,3,15,4)
		migrate_tv_shows(54,1,2009,3,26,2)
		migrate_tv_shows(55,3,2009,4,6,3)
		migrate_tv_shows(56,6,2009,10,11,4)
		migrate_tv_shows(57,3,2009,4,12,3)
		migrate_tv_shows(58,2,2011,5,13,3)
		migrate_tv_shows(59,7,2013,3,25,4)
		migrate_tv_shows(60,1,2009,10,14,2)
		migrate_tv_shows(61,1,2009,10,18,3)
		migrate_tv_shows(62,9,2009,10,29,3)
		migrate_tv_shows(63,2,2009,10,30,3)
		migrate_tv_shows(64,1,2010,1,29,2)
		migrate_tv_shows(65,3,2013,4,14,3)
		migrate_tv_shows(66,3,2012,9,27,3)
		migrate_tv_shows(67,5,2014,9,11,3)
		migrate_tv_shows(68,1,2011,1,16,3)
		migrate_tv_shows(69,1,2011,1,22,3)
		migrate_tv_shows(70,2,2011,3,8,4)
		migrate_tv_shows(71,6,2015,9,14,3)
		migrate_tv_shows(72,2,2012,10,24,4)
		migrate_tv_shows(73,3,2014,2,4,3)
		migrate_tv_shows(74,1,2011,7,7,4)
		migrate_tv_shows(75,2,2012,10,4,4)
		migrate_tv_shows(76,6,2011,9,7,5)
		migrate_tv_shows(77,1,2012,1,16,4)
		migrate_tv_shows(78,4,2014,11,21,4)
		migrate_tv_shows(79,2,2012,4,3,3)
		migrate_tv_shows(80,1,2012,4,9,4)
		migrate_tv_shows(81,1,2012,4,13,3)
		migrate_tv_shows(82,1,2012,4,16,3)
		migrate_tv_shows(83,5,2012,6,22,3)
		migrate_tv_shows(84,5,2016,5,1,5)
		migrate_tv_shows(85,1,2012,7,22,3)
		migrate_tv_shows(86,2,2014,2,23,4)
		migrate_tv_shows(87,1,2013,2,17,3)
		migrate_tv_shows(88,1,2013,2,28,3)
		migrate_tv_shows(89,1,2013,4,13,3)
		migrate_tv_shows(90,1,2013,8,13,4)
		migrate_tv_shows(91,2,2013,10,13,3)
		migrate_tv_shows(92,1,2014,2,14,3)
		migrate_tv_shows(93,3,2019,3,10,3)
		migrate_tv_shows(94,4,2017,5,14,5)
		migrate_tv_shows(95,1,2014,3,17,3)
		migrate_tv_shows(96,1,2014,11,12,3)
		migrate_tv_shows(97,1,2014,11,12,3)
		migrate_tv_shows(98,1,2014,11,19,4)
		migrate_tv_shows(99,2,2014,12,31,4)
		migrate_tv_shows(100,1,2015,1,11,2)
		migrate_tv_shows(101,4,2015,9,6,3)
		migrate_tv_shows(102,2,2015,3,29,5)
		migrate_tv_shows(103,1,2015,4,23,4)
		migrate_tv_shows(104,4,2015,4,27,3)
		migrate_tv_shows(105,1,2015,6,7,4)
		migrate_tv_shows(106,4,2015,6,16,3)
		migrate_tv_shows(107,2,2016,4,25,4)
		migrate_tv_shows(108,1,2015,7,19,3)
		migrate_tv_shows(109,1,2015,8,22,3)
		migrate_tv_shows(110,1,2015,8,26,3)
		migrate_tv_shows(111,1,2015,8,29,3)
		migrate_tv_shows(112,1,2015,9,5,3)
		migrate_tv_shows(113,1,2015,9,19,3)
		migrate_tv_shows(114,1,2015,10,4,3)
		migrate_tv_shows(115,1,2015,12,7,3)
		migrate_tv_shows(116,1,2015,12,19,4)
		migrate_tv_shows(117,1,2015,12,23,3)
		migrate_tv_shows(118,1,2016,1,2,3)
		migrate_tv_shows(119,1,2018,12,25,4)
		migrate_tv_shows(120,1,2016,4,9,4)
		migrate_tv_shows(121,1,2016,5,1,3)
		migrate_tv_shows(122,1,2016,5,8,4)
		migrate_tv_shows(123,2,2016,7,3,3)
		migrate_tv_shows(124,1,2016,8,1,4)
		migrate_tv_shows(125,1,2017,5,14,4)
		migrate_tv_shows(126,2,2017,8,4,3)
		migrate_tv_shows(127,1,2017,12,25,3)
		migrate_tv_shows(128,1,2017,12,1,3)
		migrate_tv_shows(129,1,2017,8,15,3)
		migrate_tv_shows(130,2,2017,8,15,4)
		migrate_tv_shows(131,2,2017,7,15,4)
		migrate_tv_shows(132,1,2017,9,15,4)
		migrate_tv_shows(133,1,2017,10,15,3)
		migrate_tv_shows(134,1,2017,8,28,3)
		migrate_tv_shows(135,1,2015,11,13,3)
		migrate_tv_shows(136,2,2017,10,13,4)
		migrate_tv_shows(137,1,2018,1,10,4)
		migrate_tv_shows(138,1,2018,1,23,4)
		migrate_tv_shows(139,1,2018,7,7,3)
		migrate_tv_shows(140,1,2018,7,7,4)
		migrate_tv_shows(141,1,2018,7,7,4)
		migrate_tv_shows(142,1,2018,9,2,4)
		migrate_tv_shows(143,2,2018,9,2,4)
		migrate_tv_shows(144,1,2018,9,10,4)
		migrate_tv_shows(145,1,2018,9,10,4)
		migrate_tv_shows(146,3,2018,12,10,3)
		migrate_tv_shows(147,2,2018,6,1,3)
		migrate_tv_shows(148,1,2018,6,1,3)
		migrate_tv_shows(149,1,2019,3,10,4)
		migrate_tv_shows(150,1,2019,3,17,3)
				
	end

	task :migrate_tv_shows, [:show_id, :seasons, :year, :month, :day, :rating] => :environment do |t, args|
		show = TvShow.find(args[:show_id])
		seasons = args[:seasons].to_i
		consumed_on = DateTime.new(args[:year].to_i,args[:month].to_i,args[:day].to_i)
		rating = args[:rating].to_i

		seasons.times do |season_number|
			season_number = season_number + 1
			tv_show_season = TvShowSeason.new
			tv_show_season[:title] = "#{show.title} - Season #{season_number.to_s}"
			tv_show_season[:consumed_on] = consumed_on
			tv_show_season[:tv_show_id] = show.id
			tv_show_season[:season_title] = "Season " + season_number.to_s
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
