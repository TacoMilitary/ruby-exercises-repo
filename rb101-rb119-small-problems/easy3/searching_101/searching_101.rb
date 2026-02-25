# frozen_string_literal: true

require 'yaml'

TEXTS = YAML.load_file('texts.yml')

TEXT_NOT_FOUND = '! TEXT NOT FOUND !'

SCREEN_DIVIDER = "\n--------\n "

SUFFIXES = %w[st nd rd th].freeze

UNIQUE_SUFFIX_MAX = 4

def prompt_user(prompt)
  puts prompt
  print '> '
  gets.chomp.strip
end

def display_error(message = 'Unknown error!')
  divide_screen

  puts "[ERROR]: #{message}"

  divide_screen
end

def divide_screen
  puts SCREEN_DIVIDER
end

def clear_screen
  system('clear') || system('cls') || divide_screen
end

def fetch_txt(text_alias)
  TEXTS[text_alias] || TEXT_NOT_FOUND
end

def fill_placeholders(text, replacers = {})
  filled_text = text.dup

  replacers.each do |place_name, content|
    filled_text.sub!("{{#{place_name}}}", content.to_s)
  end

  filled_text
end

def only_numbers?(str)
  removed_prefix = str.dup.delete('.')

  removed_prefix = removed_prefix[1..] if %w[- +].include?(removed_prefix.chr)

  removed_prefix.each_char.all? { |c| ('0'..'9').include?(c) }
end

def number_with_suffix(num)
  ones_place = num.to_i.abs % 10
  clamped_index = [ones_place, UNIQUE_SUFFIX_MAX].min - 1
  "#{num}#{SUFFIXES[clamped_index]}"
end

def num_input_error(user_input)
  return get_txt('invalid_input') if user_input.empty?

  return get_txt('decimal_error') if user_input.delete('.').include?('.')

  return get_txt('invalid_input') unless only_numbers?(user_input)
end

def prompt_number(prompt = TEXTS['default_num_ask'])
  loop do
    user_input = prompt_user(prompt)

    error = num_input_error(user_input)

    return user_input.to_f unless error

    display_error(error)
  end
end

def prompt_x_numbers(amount)
  Array.new(amount) do |iteration|
    iteration_prompt = fill_placeholders(
      fetch_txt('number_prompt'),
      time: number_with_suffix(iteration + 1)
    )

    value = prompt_number(iteration_prompt)

    divide_screen unless (iteration + 1) == amount

    value
  end
end

def display_results(numbers_array, final_number)
  included = numbers_array.include?(final_number)
  result_text = included ? fetch_txt('num_within') : fetch_txt('num_not_within')

  result_text = fill_placeholders(
    result_text,
    num: final_number,
    array: numbers_array
  )

  puts result_text
end

def run_program
  clear_screen
  puts fetch_txt('welcome')

  numbers = prompt_x_numbers(6)
  final_number = numbers.pop

  divide_screen
  display_results(numbers, final_number)
end

run_program
