# lib/dictionary.rb
class Dictionary
  DICTIONARY_FILE = 'google-10000-english-no-swears.txt'

  def initialize
    @words = load_words
  end

  def load_words
    File.readlines(DICTIONARY_FILE).map(&:chomp).select { |word| word.length.between?(5, 12) }
  end

  def select_random_word
    @words.sample
  end
end
