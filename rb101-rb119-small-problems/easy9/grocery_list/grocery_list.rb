# frozen_string_literal: true

def buy_fruit(grocery_list)
  final_list = []
  grocery_list.each { |item| final_list += [item.first] * item.last }
  final_list
end

def alternate_buy_fruit(grocery_list)
  grocery_list.each_with_object([]) { |item, final_list| item.last.times { final_list << item.first } }
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

p alternate_buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
