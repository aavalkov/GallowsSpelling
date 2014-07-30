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

  def letter_position
    @letter_position = @secret_word.split("").each_index.select{|i| @secret_word.split("")[i] == @letter}
  end

  def letter_checker
    if @secret_word.match(@letter) != nil
      @right_letters << @letter
    else
      @wrong_letters << @letter
    end
  end
end
