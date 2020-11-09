require 'csv'

correct_length_dictionary = Array.new

def correct_length(correct_length_dictionary, words)
	if words.length >= 5 and words.length <= 12
		correct_length_dictionary.push(words.downcase)
	else
	end
end

puts "Hangman initialized"

dictionary = CSV.open "5desk.txt"

dictionary.each do |word|
	words = word[0]
	correct_length(correct_length_dictionary, words)
end

random_word =  correct_length_dictionary.sample
puts random_word

random_word_length = random_word.length
puts random_word_length

guess_array = Array.new(random_word_length, "_")

print guess_array
puts "\n"

puts "Guess a letter If you want to solve press 1."
get_guess = gets.chomp
if get_guess == "1"
	puts "What do you think the word is?"
end
