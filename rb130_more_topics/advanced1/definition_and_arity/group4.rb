# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

# Hypothesis:
# The first invocation will work flawless, outputting "turtle" in the string.
# The second invocation will output "turtle" in the second space, then an empty
# spot after "a". Since the block expects two arguments, and only gets `turtle`,
# `seal` is assigned to nil. Since blocks have lenient arity, no error is
# raised. The third invocation raises a nameerror. Since no `animal` parameter
# is defined, the `animal` reference cannot be resolved.

# Result:
# Entirely correct.
