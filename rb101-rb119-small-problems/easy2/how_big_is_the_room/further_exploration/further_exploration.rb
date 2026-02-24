# frozen_string_literal: true

require 'yaml'

SQINCH_PER_SQFOOT = 144.0
SQCENTM_PER_SQFOOT = 929.03

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

def display_results(area_feet, area_inches, area_cm)
  divide_screen
  result_text = fill_placeholders(
    get_text('result_screen'),
    'feet' => area_feet.round(2),
    'inches' => area_inches.round(2),
    'centimeters' => area_cm.round(2)
  )

  puts result_text
end

def calculator_main
  clear_screen
  puts get_text('welcome')

  room_length, room_width = prompt_dimensions

  area_feet = room_length * room_width
  area_inches = area_feet * SQINCH_PER_SQFOOT
  area_cm = area_feet * SQCENTM_PER_SQFOOT

  display_results(area_feet, area_inches, area_cm)
end

calculator_main
