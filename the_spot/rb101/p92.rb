# frozen_string_literal: true

DEFAULT_NAME = 'Player'
DEFAULT_ROUNDS = 3
DEFAULT_DIFF = 'Easy'
ERROR_MESSAGE = 'You need to fill in all fields!'

def output_play_message(player_name, rounds, difficulty)
  message = "Welcome to Asteroid, #{player_name}! Let's play #{rounds} rounds on #{difficulty}!"
  puts message
end

def validate_game_config(name, rounds, difficulty, use_defaults)
  if use_defaults
    name = DEFAULT_NAME
    rounds = DEFAULT_ROUNDS
    difficulty = DEFAULT_DIFF
  elsif name.empty? || difficulty.empty? || rounds < 1
    # puts ERROR_MESSAGE
    # return
	  raise(StandardError, ERROR_MESSAGE)
  end

  output_play_message(name, rounds, difficulty)
end

validate_game_config('Jack', 0, 'Hard', false)
validate_game_config('', 0, '', true)
validate_game_config('Jack', 3, 'Easy', false)
validate_game_config('Jack', 3, 'Hard', true)
