require "rspec"
require "guess"
require "SecretWord"

describe SecretWord do
  it "initialize with a word" do
    new_word = SecretWord.new("giraffe")
    expect(new_word).to be_an_instance_of SecretWord
  end
end

describe Guess do
  it 'initialize with a letter' do
    new_guess = Guess.new ("a")
    another_guess = Guess.new("b")
    expect(new_guess). to be_an_instance_of Guess
    expect(Guess.guessed_letters).to eq ["a", "b"]
  end
end
