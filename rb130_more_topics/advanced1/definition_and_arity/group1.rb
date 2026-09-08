# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Hypothesis:
# my_proc will be implicitly converted to a string, representing
# the proc object and some ID.
# my_proc.class will be converted to the string Proc, since its a Proc object.
# Line 5 will output an empty space, since procs have lenient arity,
# meaning you don't have to pass an argument for every parameter, so `thing`
# will be assigned `nil`, which evaluates to "".
# Line 6 will output cat, since the argument is passed to `thing` parameter.

# Result:
# Was entirely right.
# Although, my_proc has info regarding the file it was instantiated.
