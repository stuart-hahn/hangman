# lib/game.rb
require 'yaml'
require_relative 'dictionary'
require_relative 'display'

class Game
  MAX_INCORRECT_GUESSES = 6

  def initialize
    @dictionary = Dictionary.new
    @secret_word = @dictionary.select_random_word
    @guessed_letters = []
    @incorrect_guesses = 0
    @display = Display.new(@secret_word)
  end

  def play
    puts "Welcome to Hangman!"
    until game_over?
      @display.show_progress(@guessed_letters)
      guess = prompt_player_guess
      process_guess(guess)
    end
    end_game_message
  end

  def save_game
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')
    File.open("saved_games/saved_game.yaml", 'w') { |file| file.write(YAML.dump(self)) }
    puts "Game saved!"
  end

  def self.load_game
    if File.exist?("saved_games/saved_game.yaml")
      YAML.safe_load(File.read("saved_games/saved_game.yaml"), permitted_classes: [Game, Display, Dictionary])
    else
      puts "No saved game found."
      nil
    end
  end

  private

  def game_over?
    win? || lose?
  end

  def win?
    (@secret_word.chars - @guessed_letters).empty?
  end

  def lose?
    @incorrect_guesses >= MAX_INCORRECT_GUESSES
  end

  def prompt_player_guess
    puts "Enter a letter to guess or type 'save' to save the game:"
    gets.chomp.downcase
  end

  def process_guess(guess)
    if guess == 'save'
      save_game
    elsif valid_guess?(guess)
      if @secret_word.include?(guess)
        puts "Good guess!"
        @guessed_letters << guess unless @guessed_letters.include?(guess)
      else
        puts "Wrong guess!"
        @incorrect_guesses += 1
      end
    else
      puts "Invalid guess. Please enter a single letter."
    end
  end

  def valid_guess?(guess)
    guess.match?(/^[a-z]$/) && !@guessed_letters.include?(guess)
  end

  def end_game_message
    if win?
      puts "Congratulations, you guessed the word: #{@secret_word}!"
    else
      puts "Game over! The word was: #{@secret_word}."
    end
  end
end
