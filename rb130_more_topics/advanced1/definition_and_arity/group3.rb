# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

# Hypothesis:
# The first invocation will output an empty space after "a", since in the
# method body, the block is not passed a parameter. Blocks have lenient arity
# which is why no error is raised. The `seal` parameter is just assigned nil.
# The second method invocation will raise a localjumperror, since yield is
# called, expecting a block to have been passed.

# Result:
# Entirely correct.