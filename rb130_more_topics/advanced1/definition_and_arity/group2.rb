# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class

my_lambda.call('dog')
my_second_lambda.call 'dog'
# my_lambda.call
# my_second_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Hypothesis:
# The first lambda instantiation is the normal syntax for making lambdas.
# The second instantiation is special syntax for creating lambdas, where
# the parameters are defined outside the block.
# The third instantiation will raise a NameError. The `Lambda` class does not
# exist, since lambdas are just procs with strict arity.
# Both line 4 and 5 will output the same thing, since they're both lambdas
# with the same information, just different instantiation syntax.
# Line 9 will raise an ArgumentError, since lambdas require you to pass
# arguments for every parameter, this is strict arity.
# my_lambda.class will output a proc object.

# Result:
# Entirely correct.
# Although, lines 4-5 also output `(lambda)` as info with the proc object.
