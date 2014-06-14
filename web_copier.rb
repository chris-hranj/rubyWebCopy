require 'open-uri'

p"enter a website domain you like"

website = gets.chomp
if website.count(".") >= 2
	first_letter = website.index(".") + 1
	after_first_letter = first_letter + 1
	last_letter = (website.index(".", after_first_letter) - 1)
	website_title = website[first_letter..last_letter]
elsif website.count(".") == 1
	website_title = website[0..(website.index(".") - 1)]
else
	website_title = nil
end

#unless conditionals execute if the condition is false
unless website_title.nil?
	file = open("http://#{website}")
	contents = file.read
	out_file = File.new("#{website_title}.html", "w")
	out_file.puts contents
	out_file.close
else
	p "we arent sure what you did. try again"
end
