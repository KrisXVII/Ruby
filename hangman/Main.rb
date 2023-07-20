class Word
  def pick_random_line(file)
    return File.readlines(file).sample
  end

  def create_word_to_guess(file)
    word_with_newline = pick_random_line(file).chars
    word_with_newline.pop
    word_without_newline = word_with_newline.join
    n = word_without_newline.length
    if n >= 5 and n <= 12
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
    @word_to_guess = create_word_to_guess(file)
    @len = @word_to_guess.length
  end
end

def get_response
  scan_response = gets.chomp
  return scan_response
end

def guess_check(letter)
  if letter.length != 1
    print "Only 1 letter, don't cheat please;)\n"
    next_letter_scan = gets
    next_letter = next_letter_scan.chomp
    guess_check(next_letter)
  else
    return letter
  end
end

def playgame
  file = 'C:\Users\User\OneDrive\Documenti\Ruby\hangman\google-10000-english-no-swears.txt'
  list_responses_confirm = "yes ye ya y yas yea"
  word_x = Word.new(file)
  underscores = word_x.underscores(word_x)
  guesses = 10
  guess_history = ""
  while guesses > 0 and underscores != word_x.word_to_guess
    print "\n"
    print "Guess history: #{guess_history}\t#{guesses > 1 ? ("#{guesses} left") : "Last guess!"}\n"
    print "Guessing progress: #{underscores}  #{word_x.len} letters\n"
    print "Guess a letter:"
    scan_letter = gets.chomp
    checked_letter = guess_check(scan_letter)
    guess_history += checked_letter + " "
    if word_x.word_to_guess.include?(checked_letter)
      for i in (0..word_x.len)
        if word_x.word_to_guess[i] == checked_letter
          underscores[i] = checked_letter
        end
      end
    end
    print "Guessing progress: #{underscores}\n"
    guesses -= 1
    if guesses > 0
      if underscores == word_x.word_to_guess
        print "Yess, you got it letter by letter, well done! #{word_x.word_to_guess}"
        break
      end
      print "Do you have the solution? Y/n\n"
      response = get_response
      if (list_responses_confirm).include?(response.downcase)
        print "Insert your guess here => "
        solution_guess = gets.chomp
        if solution_guess.downcase == word_x.word_to_guess
          print "Congrats! You got it right! #{word_x.word_to_guess}\n"
          break
        else
          print "Nope, go on trying to guess letters my dude\n"
          guesses += 1
        end
      end
    else
      print "You wanna try to guess this last time? Y/n\n"
      response = get_response
      if (list_responses_confirm).include?(response.downcase)
        print "Insert your final guess attempt here =>"
        final_guess = gets.chomp
        if final_guess.downcase == word_x.word_to_guess
          print "You got it at last! Congrats! The word was #{word_x.word_to_guess}\n"
        else
          print "Unlucky, you tried, the word was #{word_x.word_to_guess}\nBetter luck next time!"
        end
      else
        print "This was your word: #{word_x.word_to_guess}\nBetter luck next time!"
      end
    end
  end
end

playgame