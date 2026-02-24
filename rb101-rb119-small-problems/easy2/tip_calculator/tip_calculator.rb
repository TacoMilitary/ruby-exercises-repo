# frozen_string_literal: true

require 'yaml'

TEXTS = YAML.load_file('texts.yml')

USD_DECIMALS = 2
PERCENT_MULT = 100.0

SCREEN_DIVIDER = "\n----------\n "

TEXT_NOT_FOUND = '! TEXT NOT FOUND !'

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

def n_to_usd(num)
  formatted_num = num.to_f.round(USD_DECIMALS).to_s

  decimal_index = formatted_num.index('.')
  missing_number = formatted_num[(decimal_index + 1)..].length == 1
  formatted_num.concat('0') if missing_number

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

def only_numbers?(str)
  str.each_char.all? { |c| (('0'..'9').include?(c) || c == '.') }
end

def bill_input_error?(user_input)
  if user_input.to_f.negative?
    get_txt('zero_bill_error')
  elsif user_input.empty? || !only_numbers?(user_input)
    get_txt('invalid_error')
  end
end

def tip_input_error?(user_input)
  if user_input.to_f.negative?
    get_txt('negative_tip_error')
  elsif user_input.empty? || !only_numbers?(user_input)
    get_txt('invalid_error')
  end
end

def prompt_bill_amount
  loop do
    user_input = prompt_user(get_txt('bill_ask')).delete_prefix('$')

    error = bill_input_error?(user_input)

    return user_input.to_f unless error

    display_error(error)
  end
end

def prompt_tip_percent
  loop do
    user_input = prompt_user(get_txt('tip_ask')).delete_suffix('%')

    error = tip_input_error?(user_input)

    user_percent = user_input.to_f / PERCENT_MULT
    return user_percent unless error

    display_error(error)
  end
end

def display_receipt(tip_total, bill_total, tip_percent)
  receipt_text = fill_placeholders(
    get_txt('receipt'),
    'tip' => n_to_usd(tip_total),
    'total' => n_to_usd(bill_total),
    'percent' => tip_percent * PERCENT_MULT
  )

  puts receipt_text
end

def run
  clear_screen
  puts get_txt('welcome')

  divide_screen
  bill_amount = prompt_bill_amount

  divide_screen
  tip_percent = prompt_tip_percent

  tip_total = bill_amount * tip_percent
  bill_total = bill_amount + tip_total

  display_receipt(tip_total, bill_total, tip_percent)
end

run
