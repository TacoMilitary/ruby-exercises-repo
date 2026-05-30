# frozen_string_literal: true

FIZZBUZZ_LOGIC = proc do |num|
  divisible3 = (num % 3).zero?
  divisible5 = (num % 5).zero?
  if divisible3 && divisible5
    'FizzBuzz'
  elsif divisible3
    'Fizz'
  elsif divisible5
    'Buzz'
  else
    num
  end
end

def fizzbuzz(start_num, end_num)
  output_texts = start_num.upto(end_num).map(&FIZZBUZZ_LOGIC)
  puts output_texts.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
