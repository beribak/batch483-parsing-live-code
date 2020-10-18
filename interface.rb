require_relative "longest_word.rb"

puts "Welcome to longest word!!!"
puts "=========================="
grid = generateGrid(30)
puts "#{grid}"

puts "What is the longest word?"
start_time = Time.now
user_guess = gets.chomp.upcase
end_time = Time.now
time = end_time - start_time

english_word = englishWord?(user_guess)
valid = validWord?(grid, user_guess)
# puts word => { found: true, word: "apple", found: true, length: 5 }
# puts word["found"] => true
# puts word["word"] => "apple"

score = scoreGenerator(english_word["found"], valid, user_guess, time, grid)

if score["score"] == 0
	puts score["error"]
else
	puts score
end

