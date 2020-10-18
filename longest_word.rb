require 'json'
require 'open-uri'

def generateGrid(num)
	arr = []
	num.times{|var| arr << ("A".."Z").to_a.sample}	
	return arr
end

def englishWord?(user_guess)
	url = "https://wagon-dictionary.herokuapp.com/#{user_guess}"
	response = open(url)
	my_hash = JSON.parse(response.read)
	return  my_hash
end

def validWord?(grid, user_guess)
	user_guess.chars.all? do |letter| 
		user_guess.count(letter) <= grid.count(letter)
	end        
end

# user_guess.each do |letter|
# 	arr= []
# 	grid.each do |grid_letter|
# 		if letter == grid_letter
# 			arr << true	
# 		else
# 			arr << false
# 		end
# 	end
	
# end
def scoreGenerator(englishWord, validWord, user_guess, time, grid)
	puts englishWord
	puts validWord
	if englishWord && validWord
		result = time/60 + user_guess.length/grid.length
		return "This is you score: #{result} for #{user_guess}"
	elsif user_guess == '' 
		return {"error" => "You have to type something!!!", "score" => 0 }
	elsif !englishWord
		return {"error" => "Wrong!!!Not an English word.", "score" => 0 }
	elsif !validWord
		return {"error" => "Wrong!!!Not in the grid or you are using a letter more times then its allowed.", "score" => 0 }
	end
end
