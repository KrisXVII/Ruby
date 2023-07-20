file = 'C:\Users\User\OneDrive\Documenti\Ruby\hangman\google-10000-english-no-swears.txt'

class Word
  def pick_random_line(file)
    return File.readlines(file).sample
  end

  def create_word_to_guess(file)
    word_with_newline = pick_random_line(file).chars
    word_with_newline.pop
    word_without_newline = word_with_newline.join
    n = word_without_newline.length
    if n >= 5 and n<=12
      return word_without_newline
    else
      create_word_to_guess(file)
    end
  end

  attr_accessor :word_to_guess, :len

  def underscores(word)
    underscore = String.new
    return underscore.rjust(word.len, '_')
  end

  attr_accessor :word_to_guess, :len

  def initialize(file)
    @word_to_guess=create_word_to_guess(file)
    @len = @word_to_guess.length
  end
end

word_x = Word.new(file)
print  "Here's the word to guess: #{word_x.underscores(word_x)}  #{word_x.len} letters!"
guesses = 0

# while guesses < 5
#
# end