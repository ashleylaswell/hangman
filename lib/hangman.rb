require 'csv'

puts "Hangman initialized"

dictionary = CSV.open "5desk.txt"

dictionary.each do |word|
	puts word
end
