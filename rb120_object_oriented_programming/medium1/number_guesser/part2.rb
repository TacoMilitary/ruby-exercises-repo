# frozen_string_Literal: true

module CLI
  SCREEN_DIVIDER = "\n"

  def self.divide_screen
    print SCREEN_DIVIDER
  end

  def self.clear_screen
    system('clear') || system('cls') || divide_screen
  end

  def self.prompt(message = 'Please enter text')
    print "#{message}: "
    gets.chomp.downcase.strip
  end

  def self.display_error(message = 'Unknown error!')
    puts "[ERROR]: #{message}"
  end
end

# Orchestrator for Gameplay
class GuessingGame
  def initialize(guess_range_lower, guess_range_upper)
    @first_game = true
    @guess_range = (guess_range_lower..guess_range_upper)
  end

  def play
    CLI.clear_screen if first_game
    @first_game = false

    reset_game
    guessing_loop
    display_result
  end

  private

  def guessing_loop
    loop do
      display_guesses
      ask_player_guess
      display_guess_status

      self.guesses_left -= 1
      break if correct_guess? || no_guesses?
      CLI.divide_screen
    end
  end

  def reset_game
    @guesses_left = Math.log2(guess_range.size).to_i.next
    @correct_guess = rand(guess_range)
    @player_guess = nil
  end

  def number_str?(string)
    string.match? /\s*[-+]?\d+\s*/
  end

  def correct_guess?
    player_guess == correct_guess
  end

  def no_guesses?
    guesses_left <= 0
  end

  def display_guess_status
    return puts("That's the number!") if correct_guess?
    return puts('Your guess is too low.') if player_guess < correct_guess
    puts 'Your guess is too high.'
  end

  def validate_guess(guess)
    return "That isn't a number!" unless number_str?(guess)
    return "That's not within range!" unless guess_range.include? guess.to_i
  end

  def ask_player_guess
    loop do
      message = "Enter a number between #{format_range}"
      guess = CLI.prompt(message)

      error_message = validate_guess(guess)
      unless error_message
        self.player_guess = guess.to_i
        return
      end

      CLI.display_error(error_message)
    end
  end

  def format_range
    "#{guess_range.first - 1} and #{guess_range.last + 1}"
  end

  def display_guesses
    plural_guess_or_not = guesses_left == 1 ? 'guesse' : 'guesses'
    puts "You have #{guesses_left} #{plural_guess_or_not} remaining."
  end

  def display_result
    result_message = correct_guess? ? 'You won!' : 'You have no more guesses. You lost!'
    CLI.divide_screen
    puts result_message
  end

  attr_reader :correct_guess, :first_game, :guess_range
  attr_accessor :player_guess, :guesses_left
end

game = GuessingGame.new(501, 1500)
game.play
