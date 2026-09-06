require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  attr_reader :register, :transaction
  def setup
    @register = CashRegister.new 10
    @transaction = Transaction.new 10
    transaction.amount_paid = 10
  end

  def test_accept_money
    assert_equal(20, register.accept_money(transaction))
    assert_equal(20, register.total_money)
  end

  def test_change
    transaction.amount_paid = 15
    assert_equal(5, register.change(transaction))
  end

  def test_give_receipt
    assert_output("You've paid $#{transaction.item_cost}.\n") do
      assert_equal(nil, register.give_receipt(transaction))
    end
  end
end
