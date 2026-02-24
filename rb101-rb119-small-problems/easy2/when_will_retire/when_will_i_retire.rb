# frozen_string_literal: true

require 'yaml'

TEXTS = YAML.load_file('texts.yml')

TEXT_NOT_FOUND = '! TEXT NOT FOUND !'

SCREEN_DIVIDER = "\n---------\n "

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

  replacers.each_pair do |place_name, content|
    filled_text.gsub!("{{#{place_name}}}", content.to_s)
  end

  filled_text
end

def integer_str?(str)
  str.each_char.all? { |c| ('0'..'9').include?(c) }
end

def age_input_error?(user_input)
  get_txt('age_error') if !integer_str?(user_input) || user_input.to_i <= 0
end

def prompt_current_age
  loop do
    user_input = prompt_user(get_txt('age_ask'))

    error = age_input_error?(user_input)

    return user_input.to_i unless error

    display_error(error)
  end
end

def retire_input_error?(user_input, current_age)
  if !integer_str?(user_input)
    get_txt('age_error')
  elsif user_input.to_i <= current_age
    get_txt('younger_retire_error')
  end
end

def prompt_retire_age(current_age)
  loop do
    user_input = prompt_user(get_txt('retire_ask'))

    error = retire_input_error?(user_input, current_age)

    return user_input.to_i unless error

    display_error(error)
  end
end

def get_txt(txt_alias)
  TEXTS[txt_alias] || TEXT_NOT_FOUND
end

def prompt_info
  divide_screen
  current_age = prompt_current_age

  divide_screen
  retire_age = prompt_retire_age(current_age)

  years_to_go = retire_age - current_age

  current_year = Time.now.year
  retire_year = current_year + years_to_go

  [current_year, retire_year, years_to_go]
end

def display_deduction(current_year, retire_year, years_to_go)
  divide_screen
  deduction_text = fill_placeholders(
    get_txt('deduction'),
    'year' => current_year,
    'retire' => retire_year,
    'time' => years_to_go
  )

  puts deduction_text
end

def run
  clear_screen
  puts get_txt('welcome')

  current_year, retire_year, years_to_go = prompt_info

  display_deduction(current_year, retire_year, years_to_go)
end

run
