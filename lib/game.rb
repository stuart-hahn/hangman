require_relative "dictionary"

class Game
  attr_reader :secret_word
  def initialize
    @dictionary = Dictionary.new
    @secret_word = @dictionary.select_random_word
  end
end

game = Game.new

puts game.secret_word