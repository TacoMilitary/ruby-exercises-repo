# frozen_string_literal: true

require 'yaml'

TEXTS = YAML.load_file('texts.yml')
TEXT_NOT_FOUND = '! TEXT NOT FOUND !'

SCREEN_DIVIDER = "\n--------\n "

OPERATIONS = {
  factorials: Proc.new { |num|  },
  sum: Proc.new { |num|  }
}

OPERATION_CHOICES = OPERATIONS.keys.map { |key| key.to_s }

def divide_screen
  puts SCREEN_DIVIDER
end

def clear_screen
  system('clear') || system('cls') || divide_screen
end

def display_error(message = 'Unknown error!')
  divide_screen

  puts "[ERROR]: #{message}"

  divide_screen
end

def fetch_txt(txt_alias)
  TEXTS[txt_alias] || TEXT_NOT_FOUND
end

def prompt_user(prompt)
  puts prompt
  print '> '
  gets.chomp.strip
end

def only_int_numbers?(str)
  stripped_str = str.dup

  if stripped_str.start_with?('-') || stripped_str.start_with?('-')
    stripped_str = stripped_str[1..] 
  end
  
  str.each_char.all? { |c| ('0'..'9').include?(c) }
end

def find_int_input_error(user_input)
  input_to_integer = user_input.to_i

  if user_input.to_f > input_to_integer
    fetch_txt('decimal_error')
  elsif !only_int_numbers?(user_input)
    fetch_txt('not_a_number')
  elsif input_to_integer <= 0
    fetch_txt('bad_integer_error')
  end
end

def prompt_user_integer
  loop do
    user_input = prompt_user(fetch_txt('integer_prompt'))

    error = find_int_input_error

    return user_input.to_i unless error

    display_error(error)
  end
end

def run_program
  clear_screen
  puts fetch_txt('welcome')

  divide_screen
  int_to_use = prompt_user_integer

  
end

run_program
