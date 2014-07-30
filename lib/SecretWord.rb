class SecretWord
  def initialize(word)
    @secret_word = word
    @right_letters = []
    @wrong_letters = []
  end

  def right_letters
    @right_letters
  end

  def wrong_letters
    @wrong_letters
  end

  def already_guessed(letter)
    @wrong_letters.include?(letter) || @right_letters.include?(letter)
  end

  def unauthorized_secret(word)
    word.match(/[a-zA-Z]/) == nil || word.match(/\s/) == " ".match(/\s/)
  end

  def unauthorized_guess(letter)
    letter.length > 1 || letter.match(/[a-zA-Z]/) == nil
  end

  def win_game
    @secret_word.split("").uniq.sort == @right_letters.sort
  end
  def lose_game
    @wrong_letters.length >= 7
  end

  def letter_position
    @letter_position = @secret_word.split("").each_index.select{|i| @secret_word.split("")[i] == @letter}
  end

  def letter_checker(letter)
    @letter = letter
    if @secret_word.match(@letter) != nil
      @right_letters << @letter
    else
      @wrong_letters << @letter
    end
  end
end
