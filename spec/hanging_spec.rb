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
  it "checks the guessed letter against the secret word" do
    new_word = SecretWord.new("giraffe")
    new_word.guess("f")
    new_word.letter_checker
    expect(new_word.right_letters).to eq(["f"])
  end
end

# describe Guess do
#   before do
#     clear_guesses
#   end

#   it 'initialize with a letter' do
#     new_guess = Guess.new ("a")
#     another_guess = Guess.new("b")
#     expect(new_guess). to be_an_instance_of Guess
#     expect(Guess.guessed_letters).to eq ["a", "b"]
#   end
