require "./lib/SecretWord"
# require "./lib/body"

def main_menu
  puts "Enter a Secret Word to play Gallows Spelling"
  user_secret = gets.chomp.upcase
  secret_word = SecretWord.new(user_secret)
  puts "\e[H\e[2J"
  puts "__ " * user_secret.length
  loop do
    puts "Guess a letter"
    user_guess = gets.chomp.upcase
    secret_word.guess(user_guess)
    if user_guess == "#" #escape route
      exit
    end
    if secret_word.wrong_letters.include?(user_guess) || secret_word.right_letters.include?(user_guess)
      puts "You already guessed that letter."
    elsif user_guess.length > 1 || user_guess.to_i != nil
      puts "Only one letter please."
    else
      secret_word.letter_checker
      puts "#{secret_word.wrong_letters}"
      puts "#{secret_word.right_letters}"
      if secret_word.wrong_letters.length >= 7
        puts "Game Over"
        main_menu
      end
    end


  end
end

# def guessing
#   loop do
#     puts "Guess a letter"
#     user_guess = gets.chomp.upcase
#     secret_word.guess(user_guess)
#     secret_word.letter_checker
#     puts "#{secret_word.wrong_letters}"
#     if secret_word.wrong_letters >= 7
#       puts "Game Over"
#       main_menu
#     end
#   end
# end

main_menu
