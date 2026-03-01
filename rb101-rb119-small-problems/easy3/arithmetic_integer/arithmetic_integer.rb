# frozen_string_literal: true

require 'yaml'

TEXTS = YAML.load_file('texts.yml')
TEXT_NOT_FOUND = '! TEXT NOT FOUND !'

SCREEN_DIVIDER = "\n----------\n "

OPERATIONS_TO_PERFORM = %w[+ - * / % **].freeze

def prompt_user(prompt)
  puts prompt
  print '> '
  gets.chomp.strip
end

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

def fill_str_placeholders(text, replacers = {})
  filled_text = text.dup

  replacers.each_pair do |place_name, content|
    filled_text.sub!("{{#{place_name}}}", content.to_s)
  end

  filled_text
end

def fetch_txt(text_alias)
  TEXTS[text_alias] || TEXT_NOT_FOUND
end

def only_numbers_str?(str)
  str = str.dup[1..] if %w[- +].include?(str.chr)

  str.each_char.all? { |c| ('0'..'9').include?(c) || c == '.' }
end

def find_int_input_error(user_input)
  if !only_numbers_str?(user_input)
    fetch_txt('non_num_error')
  elsif user_input.include?('.')
    fetch_txt('float_input_error')
  elsif user_input.to_i.negative?
    fetch_txt('negative_error')
  end
end

def prompt_int_num(prompt = 'Please enter a number!')
  loop do
    user_input = prompt_user(prompt)

    error = find_int_input_error(user_input)

    return user_input.to_i unless error

    display_error(error)
  end
end

def operation_result_text(num1, num2, result, operator_str)
  fill_str_placeholders(
    fetch_txt('operation_result_text'),
    number1: num1,
    number2: num2,
    op_result: result,
    operator: operator_str
  )
end

def prompt_two_integers
  int_one = prompt_int_num(fetch_txt('first_int_ask'))

  divide_screen
  int_two = prompt_int_num(fetch_txt('second_int_ask'))

  [int_one, int_two]
end

def display_all_operations(int_one, int_two)
  OPERATIONS_TO_PERFORM.each do |operator|
    begin
      result = int_one.public_send(operator.to_sym, int_two)
    rescue ZeroDivisionError
      result = 0
    end

    puts operation_result_text(int_one, int_two, result, operator)
  end
end

def run_program
  clear_screen
  puts fetch_txt('welcome')

  divide_screen
  int_one, int_two = prompt_two_integers

  divide_screen
  display_all_operations(int_one, int_two)
end

run_program
