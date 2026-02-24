# frozen_string_literal: true

def divide_screen
  puts "\n--------\n "
end

def clear_screen
  system('clear') || system('cls') || divide_screen
end

def display_error(message = 'Unknown error!')
  puts "[ERROR]: #{message}"
end

def prompt_user(prompt)
  puts prompt
  print '> '
  gets.chomp.strip
end

def prompt_name
  loop do
    user_input = prompt_user("What's your name?")

    unless user_input.empty?
      user_name = user_input.split(' ')
      user_name.map!(&:captitalize)

      return user_name.join(' ')
    end

    display_error('Please, just tell me what your name is.')
  end
end

def welcome_user(user_name)
  welcome_msg = "Hello, \"#{user_name}\"."

  if user_name.end_with?('!')
    welcome_msg = "HELLO, #{user_name.chop.upcase} WHY ARE WE SCREAMING?"
  end

  puts welcome_msg
end

def run
  user_name = prompt_name

  welcome_user(user_name)
end

run
