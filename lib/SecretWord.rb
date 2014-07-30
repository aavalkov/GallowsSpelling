class SecretWord

  def initialize(word)
    @secret_word = word
    @right_letters = []
    @wrong_letters = []
  end

  def guess(letter)
    @letter = letter
  end

  def right_letters
    @right_letters
  end

  def wrong_letters
    @wrong_letters
  end

  def clear_guesses
    @right_letters = []
    @wrong_letters = []
  end

  def letter_checker
    @correct_guess = @secret_word.split("").each_index.select{|i| @secret_word.split("")[i] == @letter}
    if @correct_guess.length > 0
      @right_letters << @letter
    else
      @wrong_letters << @letter
    end
  end

  def correct_guess
    @correct_guess
  end
end
