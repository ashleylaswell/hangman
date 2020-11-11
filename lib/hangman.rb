require 'csv'

def correct_length(correct_length_dictionary, words)
	if words.length >= 3 and words.length <= 5 
		correct_length_dictionary.push(words.downcase)
	end
end

def solicit_move
	puts "Guess a letter. If you want to solve press 1."
end

def print_guess_array(guess_array)
	print guess_array
	puts "\n"	
end

def solve_message
	puts "What do you think the word is?"
end

def want_to_solve?(letter_guess)
	letter_guess == "1"
end

def correct_word?(solve, random_word)
	solve == random_word
end

def wrong_guess?(random_word, letter_guess)
	random_word.include?(letter_guess) == false
end

def print_wrong_guesses(wrong_guesses_left)
	puts "You have #{wrong_guesses_left} wrong guesses left."
end

def print_already_guessed_array(already_guessed_array)
	print already_guessed_array
	puts "\n"
end

def guesses_left?(guess_array)
	guess_array.include?("_")
end

def game_over?(wrong_guesses_left)
	wrong_guesses_left == 1
end

def play(guess_array, already_guessed_array, random_word, random_word_length, wrong_guesses_left)
	while guesses_left?(guess_array)
		solicit_move
		letter_guess = gets.chomp
		if want_to_solve?(letter_guess)
			solve_message
			solve = gets.chomp
			if correct_word?(solve, random_word)
				puts "you win!"
				return
			end	
		end
		i = 0
		while i < random_word_length
			if guesses_left?(guess_array) == false and wrong_guesses_left >= 1
				puts "you win"
				return
			elsif game_over?(wrong_guesses_left) 
				puts "You lost"
				puts "The word was #{random_word}."
				return
			elsif letter_guess == random_word[i]
				guess_array[i] = letter_guess
			elsif wrong_guess?(random_word, letter_guess)
				wrong_guesses_left -= 1
				already_guessed_array.push(letter_guess)
				break
			end
		i += 1
		end
		print_guess_array(guess_array)
		print_already_guessed_array(already_guessed_array)
		if guesses_left?(guess_array)
			print_wrong_guesses(wrong_guesses_left)
		end
	end
end

puts "Hangman initialized"

dictionary = CSV.open "5desk.txt"
correct_length_dictionary = Array.new

dictionary.each do |word|
	words = word[0]
	correct_length(correct_length_dictionary, words)
end

random_word =  correct_length_dictionary.sample
random_word_length = random_word.length

guess_array = Array.new(random_word_length, "_")
already_guessed_array = Array.new
wrong_guesses_left = 10

print_guess_array(guess_array)
play(guess_array, already_guessed_array, random_word, random_word_length, wrong_guesses_left)
