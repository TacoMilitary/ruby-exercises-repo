# frozen_string_literal: true

library = {
  "Moby Dick" => { author: "Herman Melville", copies: 3 },
  "1984" => { author: "George Orwell", copies: 5 },
}

def book_valid_title?(book_title)
  book_title.is_a?(String) && !book_title.strip.empty?
end

def add_new_book(book_collection, title, author_name = 'Unknown', amount = 1)
  unless book_valid_title?(title)
    puts('You must name your book!')
    return
  end
  book_hash = { author: author_name, copies: amount }
  book_collection[title] = book_hash
  puts "Added #{title} to the library!"
end

def delete_book(book_collection, book_title)
  book_collection.delete(book_title)
  puts "#{book_title} has been removed from the library!"
end

def delete_if_no_copies(book_collection, book_title, copies)
  delete_book(book_collection, book_title) if copies <= 0
end

def checkin(book_collection, book_title)
  book = book_collection[book_title]
  if book
    book[:copies] += 1
  else
    add_new_book(book_collection, book_title)
  end
end

def checkout(book_collection, book_title)
  book = book_collection[book_title]
  if book
    book[:copies] -= 1
    delete_if_no_copies(book_collection, book_title, book[:copies])
  else
    puts "Sorry, there's no book named #{book_title}!"
  end
end

checkin(library, "Moby Dick")

puts library

checkout(library, "1984")

puts library

checkout(library, "Black Mamba")

checkin(library, "Black Mamba")
