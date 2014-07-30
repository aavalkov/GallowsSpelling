class Guess
  @@guessed_letters = []

  def initialize(letter)
    @letter = letter
    @@guessed_letters << @letter
  end

  def Guess.guessed_letters
    @@guessed_letters
  end
end
