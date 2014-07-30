require "./lib/SecretWord"
# require "./lib/body"

def main_menu
  clear_screen
  puts "Enter a Secret Word to play Gallows Spelling\nPress '#' to exit the program at any time."
  user_secret = gets.chomp.upcase
  secret_word = SecretWord.new(user_secret)
  spaces = ["_"] * user_secret.length

  if user_secret == "#" #escape route
    exit
  elsif secret_word.unauthorized_secret(user_secret)
    main_menu
  end
  clear_screen
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
      clear_screen
      secret_word.letter_position.each {|index| spaces[index] = user_guess}
      puts spaces.join(" ")
      puts "\nWrong guesses: #{secret_word.wrong_letters.join(", ")}" if secret_word.wrong_letters.length >= 1
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

def clear_screen
  puts "\e[H\e[2J"
end

main_menu
