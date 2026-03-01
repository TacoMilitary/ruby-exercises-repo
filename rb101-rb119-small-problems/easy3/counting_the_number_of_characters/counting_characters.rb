# frozen_string_literal: true

require 'yaml'

TEXTS = YAML.load_file('texts.yml')

SCREEN_DIVIDER = "\n---------\n "

TEXT_NOT_FOUND = '! TEXT NOT FOUND !'

def prompt_user(prompt)
  puts prompt
  print '> '
  gets.chomp.strip
end

def divide_screen
  puts SCREEN_DIVIDER
end

def display_error(message = 'Unknown error!')
  divide_screen

  puts "[ERROR]: #{message}"

  divide_screen
end

def clear_screen
  system('clear') || system('cls') || divide_screen
end

def fill_placeholders(text, replacers = {})
  filled_text = text.dup

  replacers.each do |place_name, content|
    filled_text.sub!("{{#{place_name}}}", content.to_s)
  end

  filled_text
end

def fetch_txt(text_alias)
  TEXTS[text_alias] || TEXT_NOT_FOUND
end

def ask_for_string
  loop do
    user_input = prompt_user(fetch_txt('ask_for_string'))

    return user_input unless user_input.empty?

    display_error(fetch_txt('empty_error'))
  end
end

def display_char_count(original_string, char_count)
  fetch_alias = char_count > 1 ? 'multiple_characters' : 'one_character'

  output_text = fill_placeholders(
    fetch_txt(fetch_alias),
    count: char_count,
    text: original_string
  )

  puts output_text
end

def user_string_and_char_count
  user_string = ask_for_string
  char_count = user_string.gsub(' ', '').length

  [user_string, char_count]
end

def run_program
  clear_screen
  puts fetch_txt 'welcome'

  divide_screen
  user_string, char_count = user_string_and_char_count

  divide_screen
  display_char_count(user_string, char_count)
end

run_program
