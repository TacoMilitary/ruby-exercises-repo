class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end

  protected

  attr_reader :amount
end

bills_wallet = Wallet.new 500
pennys_wallet = Wallet.new 465
if bills_wallet > pennys_wallet
  puts 'Bill has more motion than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has hella motion, more than Bill'
else
  puts 'They have the same amount of money'
end