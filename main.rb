# main.rb
require_relative 'lib/game'

puts "Welcome to Hangman! Would you like to load a saved game? (y/n)"
response = gets.chomp.downcase

if response == 'y'
  game = Game.load_game
end

game ||= Game.new
game.play
