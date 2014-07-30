require "rspec"
require "SecretWord"

describe SecretWord do
    # before do
    #   clear_guesses
    # end

  it "initialize with a word" do
    new_word = SecretWord.new("giraffe")
    expect(new_word).to be_an_instance_of SecretWord
  end

  it "returns the position of correct letters in secret word" do
    new_word = SecretWord.new("giraffe")
    new_word.guess("f")
    new_word.letter_position
    expect(new_word.letter_position).to eq([4, 5])
  end

  it "checks the guessed letter against the secret word" do
    new_word = SecretWord.new("giraffe")
    new_word.guess("f")
    new_word.letter_checker
    expect(new_word.right_letters).to eq(["f"])
  end

  it "checks the guessed letter against the secret word" do
    new_word = SecretWord.new("giraffe")
    new_word.guess("o")
    new_word.letter_checker
    expect(new_word.wrong_letters).to eq(["o"])
  end

  it "checks to see if the player has won" do
    new_word = SecretWord.new("giraffe")
    new_word.guess("g")
    new_word.letter_checker
    new_word.win_game
    puts new_word.right_letters
    puts new_word.win_game
    expect(new_word.win_game).to eq(false)
  end
end
