require "./lib/SecretWord"
# require "./lib/body"

def main_menu
  puts "\e[H\e[2J"
  puts "Enter a Secret Word to play Gallows Spelling\nPress '#' to exit the program at any time."
  user_secret = gets.chomp.upcase
  if user_guess == "#" #escape route
    exit
  elsif user_secret.match(/[a-zA-Z]/) == nil
    main_menu
  end
  secret_word = SecretWord.new(user_secret)
  puts "\e[H\e[2J"
  spaces = ["_"] * user_secret.length
  puts spaces.join(" ")

  loop do
    puts "\nGuess a letter"
    user_guess = gets.chomp.upcase
    secret_word.guess(user_guess)
    if user_guess == "#" #escape route
      exit
    end
    if secret_word.wrong_letters.include?(user_guess) || secret_word.right_letters.include?(user_guess)
      puts "You already guessed that letter."
    elsif user_guess.length > 1 || user_guess.match(/[a-zA-Z]/) == nil
      puts "Only one letter please."
    else
      secret_word.letter_checker
      puts "\e[H\e[2J"
      secret_word.letter_position.each do |index|
        spaces[index] = user_guess
      end
      puts spaces.join(" ")
      if spaces.include?("_") && secret_word.wrong_letters.length > 0
        puts "\nWrong guesses: #{secret_word.wrong_letters.join(", ")}"
      elsif spaces.include?("_") == false
        puts "You guessed the Secret Word!\nPress any key to play again."
        if gets
          main_menu
        end
      end
      if secret_word.wrong_letters.length >= 7
        puts "\nGame Over.  Too many guesses.  \nPress any key to play again."
        if gets
          main_menu
        end
      end
    end
  end
end

main_menu
