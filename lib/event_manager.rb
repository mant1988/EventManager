puts "EventManager Initialized!"

EVENT_ATTENDEES = "event_attendees.csv"

if File.exist?(EVENT_ATTENDEES)
	lines = File.readlines(EVENT_ATTENDEES)
	lines.each_with_index do |line, index|
		next if index == 0
	  	columns = line.split(",")
	  	name = columns[2]
	  	puts name
	  	index
	end
end