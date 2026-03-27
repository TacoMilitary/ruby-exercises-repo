# frozen_string_literal: true

library = {
  "Moby Dick" => { author: "Herman Melville", copies: 3 },
  "1984" => { author: "George Orwell", copies: 5 },
}

def add_new_book(book_collection, title, author_name = 'Unknown', amount = 1)
  return puts('You must name your book!') unless title
  book_hash = { author: author_name, copies: amount}
  book_collection[title] = book_hash
end

def checkin(book_collection, book_title)
  book = book_collection[book_title]
  if book
    book[:copies] += 1
  else
    add_new_book(book_collection, book_title)
    puts "Added #{book_title} to the library!"
  end
end

def checkout(book_collection, book_title)
  book = book_collection[book_title]
  if book
    if book[:copies] <= 1
      book_collection[book_title] = nil
      puts "#{book_title} has been removed from the library!"
      return
    end
    book[:copies] -= 1
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
