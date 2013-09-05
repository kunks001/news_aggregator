namespace :admin do
	desc "Fill newspaper table with news headlines"	
	task parse: :environment do
		parse_guardian
		parse_metro
	end
end


def parse_guardian
	require 'rss'
	require 'open-uri'

	rss = RSS::Parser.parse(open('http://feeds.theguardian.com/theguardian/uk/rss').read, false)

	rss.items.each do |i| 
		newspaper = "Guardian"
		title = i.title
		date = i.date
		link = i.link
		# puts "#{title}, #{date}"
		Newspaper.create!(newspaper: newspaper,
						  title: title,
						  date: date,
						  link: link)
	end
end

def parse_metro
	require 'rss'
	require 'open-uri'

	rss = RSS::Parser.parse(open('http://metro.co.uk/feed/').read, false)

	rss.items.each do |i| 
		newspaper = "Metro"
		title = i.title
		date = i.date
		link = i.link
		# puts "#{title}, #{date}"
		Newspaper.create!(newspaper: newspaper,
						  title: title,
						  date: date,
						  link: link)
	end
end