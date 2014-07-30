require "./lib/SecretWord"
# require "./lib/body"

def main_menu
  puts "\e[H\e[2J"
  puts "Enter a Secret Word to play Gallows Spelling\nPress '#' to exit the program at any time."
  user_secret = gets.chomp.upcase
  if user_secret == "#" #escape route
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
    exit if user_guess == "#" #escape route

    if secret_word.already_guessed(user_guess)
      puts "You already guessed that letter."
    elsif secret_word.unauthorized_guess(user_guess)
      puts "Only one letter please."
    else
    secret_word.letter_checker(user_guess)
      puts "\e[H\e[2J"
      secret_word.letter_position.each do |index|
        spaces[index] = user_guess
      end
      puts spaces.join(" ")
      puts "\nWrong guesses: #{secret_word.wrong_letters.join(", ")}"

      if secret_word.win_game
        puts "You guessed the Secret Word!\nPress any key to play again."
        main_menu if gets
      elsif secret_word.lose_game
        puts "\nGame Over.  Too many guesses.  \nPress any key to play again."
        main_menu if gets
      end
    end
  end
end

main_menu
