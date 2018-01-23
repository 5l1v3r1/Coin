# # # # # # # #
#!/usr/bin/env ruby
# # # # # # #

# # # # # #
# Created January 12th 2018
# Copyright (c) 2017 Beyar N.
# # # #

# # #
# Name: coin.rb
# #

# Clear
system "clear" or system "cls"

# Modules
begin
	require "open-uri"
	rescue LoadError
	system "gem install openurl"
end

begin
	require "nokogiri"
	rescue LoadError
	system "gem install nokogiri"
end

# Variables
align1 = 3
align2 = 5
align3 = 15
alignx = 17
x = 1
url = "https://coinmarketcap.com/"

# Parsing
keepTrack = []
@doc = Nokogiri::HTML(open(url))
newSite = 0
parse = true
while parse == true
	begin
		array = @doc.css("tr")[x].text.delete(" ").split("\n")
	rescue NoMethodError
		parse = false
	end
	rawArr = []
	parsedArr = []
		for each in array
			if each == ""
				next
			else
				rawArr.push(each)
			end
		end
	parsedArr = rawArr.uniq
	begin
	keepTrack << "| #{parsedArr[0].center(align1)} | #{parsedArr[1].center(align2)} | #{parsedArr[4].center(alignx)} | #{parsedArr[7].center(align3)} |"
	rescue NoMethodError
	end
	x = x + 1
end

# Removes all the dupes
output = keepTrack.uniq
for row in output
	puts row
end
