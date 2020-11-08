require 'csv'

puts "Hangman initialized"

dictionary = CSV.open "5desk.txt"

dictionary.each do |word|
	word_list = word[0]

	next if word_list.length < 5 or word_list.length > 12
	puts word_list
end
