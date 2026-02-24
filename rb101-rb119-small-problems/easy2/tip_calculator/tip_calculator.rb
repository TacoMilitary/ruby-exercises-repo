# frozen_string_literal: true

require 'yaml'

TEXTS = YAML.load_file('texts.yml')

USD_DECIMALS = 2
PERCENT_MULT = 100.0

SCREEN_DIVIDER = "\n----------"

TEXT_NOT_FOUND = '! TEXT NOT FOUND !'

def divide_screen
  puts SCREEN_DIVIDER
end

def clear_screen
  system('clear') || system('cls') || divide_screen
end

def n_to_usd(n)
  formatted_num = n.to_f.round(USD_DECIMALS).to_s

  decimal_index = formatted_num.index('.')
  formatted_num.concat('0') if formatted_num[(decimal_index + 1)..-1].length == 1

  "$#{formatted_num}"
end

def prompt_user(prompt)
  puts prompt
  print '> '
  gets.chomp.strip
end

def fill_placeholders(text, replacers = {})
  filled_text = text.dup
  replacers.each_pair do |place_name, content|
    filled_text.sub!("{{#{place_name}}}", content.to_s)
  end

  filled_text
end

def get_txt(text_to_find)
  TEXTS[text_to_find] || TEXT_NOT_FOUND
end

def run
  clear_screen
  puts get_txt('welcome')

  divide_screen
  bill_amount = 500.0

  divide_screen
  tip_percent = 0.15

  tip_total = bill_amount * tip_percent
  bill_total =  bill_amount + tip_total

  receipt_text = fill_placeholders(
    get_txt('receipt'),
    'tip' => n_to_usd(tip_total),
    'total' => n_to_usd(bill_total),
    'percent' => tip_percent * PERCENT_MULT
  )

  puts receipt_text
end

run
