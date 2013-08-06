require "csv"
require "sunlight/congress"
require "erb"

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

#should declare method on above
def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zipcode)
	Sunlight::Congress::legislators.by_zipcode(zipcode)
end

puts "EventManager Initialized!"

FILE = "event_attendees.csv"

if File.exist?(FILE)
	content = CSV.open FILE , :headers => true, :header_converters => :symbol
  template_letter = File.read "form_letter.erb"
	content.each do |row|
	first_name = row[:first_name]

	zipcode = clean_zipcode(row[:zipcode])

	legislators = legislators_by_zipcode(zipcode)

	form_letter = erb_template.result(binding)
	puts form_letter
	end
end
