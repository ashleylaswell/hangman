require 'csv'

def correct_length(word_list)
	if word_list.length > 5 and word_list.length < 12
		word_list
	else
	end
end

puts "Hangman initialized"

dictionary = CSV.open "5desk.txt"

dictionary.each do |word|
	word_list = word[0]

	puts correct_length(word_list)
end
