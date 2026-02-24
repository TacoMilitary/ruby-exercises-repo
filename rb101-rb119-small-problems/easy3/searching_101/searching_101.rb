# frozen_string_literal: true
require 'yaml'

TEXTS = YAML.load_file('texts.yml')

TEXT_NOT_FOUND = '! TEXT NOT FOUND !'

SCREEN_DIVIDER = "\n--------\n "

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
    filled_text.sub!("{{#{place_name.to_s}}}", content.to_s)
  end

  filled_text
end

def run_program
  clear_screen
  puts fetch_txt('welcome')


end

run_program
