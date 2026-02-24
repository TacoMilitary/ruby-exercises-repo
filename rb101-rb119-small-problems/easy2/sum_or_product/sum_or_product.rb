# frozen_string_literal: true

require 'yaml'

TEXTS = YAML.load_file('texts.yml')
TEXT_NOT_FOUND = '! TEXT NOT FOUND !'

SCREEN_DIVIDER = "\n--------\n "

OPERATIONS = {
  factorials: Proc.new { |num|  },
  sum: Proc.new { |num|  }
}

OPERATION_CHOICES = OPERATIONS.keys.map { |key| key.to_s }

def divide_screen
  puts SCREEN_DIVIDER
end

def clear_screen
  system('clear') || system('cls') || divide_screen
end

def fetch_txt(txt_alias)
  TEXTS[txt_alias] || TEXT_NOT_FOUND
end

def prompt_user(prompt)
  puts prompt
  print '> '
  gets.chomp.strip
end

def run_program

end

run_program
