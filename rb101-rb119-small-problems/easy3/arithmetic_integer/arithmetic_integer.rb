# frozen_string_literal: true

require 'yaml'

SCREEN_DIVIDER = "\n----------\n "

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

def run_program
  clear_screen
end

run_program