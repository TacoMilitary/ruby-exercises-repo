# frozen_string_literal: true

# Stack Machine
class Minilang
  FAIL_COMMAND = :fail
  SUCCESS_COMMAND = :success

  EMPTY_STACK_VALIDATION = :empty_stack_validation
  DIVIDE_BY_ZERO_VALIDATION = :divide_by_zero_validation

  COMMANDS_AND_VALIDATION = {
    push: nil,
    add: EMPTY_STACK_VALIDATION,
    sub: EMPTY_STACK_VALIDATION,
    mult: EMPTY_STACK_VALIDATION,
    div: [EMPTY_STACK_VALIDATION, DIVIDE_BY_ZERO_VALIDATION],
    mod: [EMPTY_STACK_VALIDATION, DIVIDE_BY_ZERO_VALIDATION],
    pop: EMPTY_STACK_VALIDATION,
    print: nil
  }.freeze

  def initialize(argument)
    @register = 0
    @stack = []
    @argument = argument
  end

  def eval
    argument.split.each do |possible_command|
      break if run_command(possible_command) == FAIL_COMMAND
    end
  end

  private

  def command?(possible_command)
    number_command?(possible_command) ||
      COMMANDS_AND_VALIDATION.keys.include?(possible_command)
  end

  def empty_stack_validation
    'Empty stack!' if stack.empty?
  end

  def divide_by_zero_validation
    'Cannot divide by 0!' if register.zero?
  end

  def run_command_rules(rules)
    return send(rules) unless rules.is_a?(Array)

    rules.each do |rule|
      error = send(rule)
      return error if error
    end
    nil
  end

  def validate_command(token)
    return "Invalid Token: #{token.upcase}" unless command?(token)

    command_rules = COMMANDS_AND_VALIDATION[token]
    return if command_rules.nil?

    run_command_rules(command_rules)
  end

  def run_command(original_argument)
    command = original_argument.downcase.to_sym

    error_message = validate_command(command)
    if error_message
      puts error_message
      return FAIL_COMMAND
    end

    call_command_method(command)

    SUCCESS_COMMAND
  end

  def call_command_method(command)
    return n(command) if number_command?(command)

    send(command)
  end

  def n(new_register)
    self.register = new_register.to_s.to_i
  end

  def push
    stack << register
  end

  def add
    self.register += stack.pop
  end

  def sub
    self.register -= stack.pop
  end

  def mult
    self.register *= stack.pop
  end

  def div
    self.register /= stack.pop
  end

  def mod
    self.register = register % stack.pop
  end

  def pop
    self.register = stack.pop
  end

  def print
    puts register
  end

  def number_command?(command)
    command.to_s == command.to_s.to_i.to_s
  end

  attr_reader :stack, :argument
  attr_accessor :register
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
