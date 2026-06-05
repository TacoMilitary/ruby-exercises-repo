# frozen_string_literal: true

def greetings(name_parts, title_parts)
  full_name = name_parts.join ' '
  full_title = "#{title_parts[:title]} #{title_parts[:occupation]}" # title_parts.values.join ' '
  greeting = "Hello, #{full_name}! Nice to have a #{full_title} around."
  puts greeting
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => "Hello, John Q Doe! Nice to have a Master Plumber around."
