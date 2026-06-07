# frozen_string_literal: true

stack_machine = {register: 0, stack: []}

COMMANDS = {
  'n' => proc do |number|
    stack_machine[:register] = number
  end,

  'PUSH' => proc do
    stack_machine[:stack].push stack_machine[:register]
  end,

  'ADD' => proc do
    stack_machine[:register] += stack_machine[:stack].pop
  end,

  'SUB' => proc do
    stack_machine[:register] -= stack_machine[:stack].pop
  end,

  'MULT' => proc do
    stack_machine[:register] *= stack_machine[:stack].pop
  end,

  'DIV' => proc do
    stack_machine[:register] /= stack_machine[:stack].pop
  end,

  'MOD' => proc do
    stack_machine[:register] = stack_machine[:register] % stack_machine[:stack].pop
  end,

  'POP' => proc do
    stack_machine[:register] = stack_machine[:stack].pop
  end,

  'PRINT' => proc do
    puts stack_machine[:register]
  end,
}

def minilang(args)
  args.split.each do |argument|
    if argument.match? /\A[-+]?\d+\Z/
      COMMANDS['n'].call argument.to_i
    else
      COMMANDS[argument].call
    end
  end
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

minilang('5 PUSH 4 MULT PUSH 3 ADD ')