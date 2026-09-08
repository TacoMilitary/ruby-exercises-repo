require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  attr_reader :transaction

  def setup
    @transaction = Transaction.new 20
  end

  def test_prompt_for_payment
    amount_to_input = "20\n"
    simulated_input = StringIO.new amount_to_input
    transaction.prompt_for_payment(input: simulated_input, output: StringIO.new)
    assert_equal(amount_to_input.to_f, transaction.amount_paid)
  end
end
