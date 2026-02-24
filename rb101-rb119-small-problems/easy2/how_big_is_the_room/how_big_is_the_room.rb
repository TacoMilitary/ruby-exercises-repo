# frozen_string_literal: true

require 'yaml'

SQFOOT_PER_SQMETER = 10.7639

SCREEN_DIVIDER = "\n--------"

TEXTS = YAML.load_file('texts.yml')

def prompt_user(prompt)
  puts prompt
  print '> '
  gets.chomp.strip
end

def divide_screen
  puts SCREEN_DIVIDER
end

def clear_screen
  system('clear') || divide_screen
end

def get_text(to_get)
  TEXTS[to_get]
end

def fill_placeholders(text, replacers = {})
  filled_text = text.dup

  replacers.each_pair do |place_name, replacement|
    filled_text.sub!("\#\{#{place_name}\}", replacement.to_s)
  end

  filled_text
end

def prompt_dimensions
  divide_screen
  room_length = prompt_user(get_text('length_ask')).to_f

  divide_screen
  room_width = prompt_user(get_text('width_ask')).to_f

  [room_length, room_width]
end

def display_results(area_meters, area_feet)
  divide_screen
  result_text = fill_placeholders(
    get_text('result_screen'),
    'meters' => area_meters.truncate(2),
    'feet' => area_feet.truncate(2)
  )

  puts result_text
end

def calculator_main
  clear_screen
  puts get_text('welcome')

  room_length, room_width = prompt_dimensions

  area_meters = room_length * room_width
  area_feet = area_meters * SQFOOT_PER_SQMETER

  display_results(area_meters, area_feet)
end

calculator_main
