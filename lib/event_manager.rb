require "csv"

#should declare method on above
def clean_zipcode(zipcode)
	if zipcode.nil?
		zipcode = "00000"
	elsif zipcode.length < 5
		zipcode = zipcode.rjust 5, "0"
	elsif zipcode.length > 5
		zipcode = zipcode[0..4]
	else
		zipcode
	end
end

puts "EventManager Initialized!"

FILE = "event_attendees.csv"

if File.exist?(FILE)
	content = CSV.open FILE , :headers => true, :header_converters => :symbol
	content.each do |row|
		first_name = row[:first_name]

		zipcode = clean_zipcode(row[:zipcode])
		
		puts "#{first_name}: #{zipcode}"
	end
end