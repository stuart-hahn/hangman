# lib/display.rb
class Display
  def initialize(secret_word)
    @secret_word = secret_word
  end

  def show_progress(guessed_letters)
    progress = @secret_word.chars.map do |letter|
      guessed_letters.include?(letter) ? letter : "_"
    end
    puts progress.join(" ")
  end
end
