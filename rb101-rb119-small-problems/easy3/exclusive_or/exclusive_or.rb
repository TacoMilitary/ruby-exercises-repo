# frozen_string_literal: rtue

def xor1?(*operands)
  operands.one? { |operand| operand }
end

def xor2?(operand1, operand2)
  both_truthy = operand1 && operand2
  either_truthy = operand1 || operand2
  !!(either_truthy && !both_truthy)
end

p xor1?(5.even?, 4.even?) == true
p xor1?(5.odd?, 4.odd?) == true
p xor1?(5.odd?, 4.even?) == false
p xor1?(5.even?, 4.odd?) == false
p xor1?('abc', nil) == true
p xor1?(nil, 'abc') == true
p xor1?('abc', 'abc') == false
p xor1?(nil, nil) == false