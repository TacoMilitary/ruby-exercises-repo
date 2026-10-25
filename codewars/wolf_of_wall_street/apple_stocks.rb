def get_max_profit(stock_prices_yesterday)
  stock_pair = stock_prices_yesterday.combination(2).max_by { _1[1] - _1[0] }
  stock_pair.push(stock_pair[1] - stock_pair[0])
  stock_pair
end

# Index is the time in minutes past 9:30am.
# Values are stock cost of apple in dollars.

# Return a three element array.
# [ Best Buy Price, Best Sell Price, Profit ]

# We are selling the same apple we bought.
# This means that the sell price has to be after the buy price.

# Best Buy - Lowest Value
# Best Sell - Highest Value after best buy

# Profit - Sell price minus the reverse value of Buy price.

# For each two pairs of values.
# Find the pair with the highest profit sum.
# Create a three element array.