require "csv"
puts "EventManager Initialized!"

FILE = "event_attendees.csv"

if File.exist?(FILE)
	content = CSV.open FILE , :headers => true, :header_converters => :symbol
	content.each do |row|
		first_name = row[:first_name]
		zipcode = row[:zipcode]
		puts "#{first_name}: #{zipcode}"
	end
end