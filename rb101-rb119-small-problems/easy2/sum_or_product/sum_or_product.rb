# frozen_string_literal: true

require 'yaml'

TEXTS = YAML.load_file('texts.yml')
TEXT_NOT_FOUND = '! TEXT NOT FOUND !'

SCREEN_DIVIDER = "\n--------\n "

def fetch_txt(txt_alias)
  TEXTS[txt_alias] || TEXT_NOT_FOUND
end

OPERATIONS = {
  factorials: {
    proc: proc { |num| 1.upto(num).reduce(&:*) },
    text: fetch_txt('factorial_result')
  },

  sum: {
    proc: proc { |num| 1.upto(num).sum },
    text: fetch_txt('sum_result')
  }
}.freeze

OPERATION_CHOICES = OPERATIONS.keys.freeze

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

def prompt_user(prompt)
  puts prompt
  print '> '
  gets.chomp.strip
end

def fill_placeholders(text, replacers = {})
  filled_text = text.dup

  replacers.each do |place_name, content|
    filled_text.sub!("{{#{place_name}}}", content.to_s)
  end

  filled_text
end

def only_numbers?(str)
  stripped_str = str.dup

  stripped_str = stripped_str[1..] if stripped_str.start_with?('-') ||
                                      stripped_str.start_with?('+')

  stripped_str.each_char.all? { |c| ('0'..'9').include?(c) || c == '.' }
end

def find_int_input_error(user_input)
  input_to_integer = user_input.to_i

  if user_input.to_f > input_to_integer
    fetch_txt('decimal_error')
  elsif !only_numbers?(user_input)
    fetch_txt('not_a_number')
  elsif input_to_integer <= 0
    fetch_txt('bad_integer_error')
  end
end

def prompt_user_integer
  loop do
    user_input = prompt_user(fetch_txt('integer_prompt'))

    error = find_int_input_error(user_input)

    return user_input.to_i unless error

    display_error(error)
  end
end

def find_operation(downcased_input)
  OPERATION_CHOICES.find do |operation|
    operation.to_s.start_with?(downcased_input)
  end
end

def operation_and_error(user_input)
  operation_name = find_operation(user_input.downcase)
  error = nil

  if user_input.empty?
    error = fetch_txt('empty_input')
  elsif operation_name
    operation_name = found_operation.to_s
  else
    error = fetch_txt('no_operation')
  end

  [operation_name, error]
end

def prompt_user_operation
  loop do
    user_input = prompt_user(fetch_txt('operation_prompt'))

    operation, error = operation_and_error(user_input)

    return operation unless error

    display_error(error)
  end
end

def perform_operation(operation_to_perform, integer)
  symbol_alias = operation_to_perform.to_sym
  operation_block = OPERATIONS[symbol_alias][:proc]

  operation_block.call(integer)
end

def operation_result_text(operation, used_num, result)
  symbol_alias = operation.to_sym
  operation_text = OPERATIONS[symbol_alias][:text]

  fill_placeholders(
    operation_text,
    'result' => result,
    'integer' => used_num
  )
end

def prompt_calc_info
  int_to_use = prompt_user_integer

  divide_screen
  operation_to_use = prompt_user_operation

  [operation_to_use, int_to_use]
end

def display_calculation(operation_to_use, int_to_use)
  result = perform_operation(operation_to_use, int_to_use)
  result_text = operation_result_text(operation_to_use, int_to_use, result)

  puts result_text
end

def run_program
  clear_screen
  puts fetch_txt('welcome')

  divide_screen
  operation_to_use, int_to_use = prompt_calc_info

  divide_screen
  display_calculation(operation_to_use, int_to_use)
end

run_program
