PETALS = ['I love you', 'a little', 'a lot', 'passionately', 'madly', 'not at all']

def how_much_i_love_you(nb_petals)
  PETALS[nb_petals.pred % PETALS.size]
end

# Given a number of petals.
# Phrases will be repeated.
# Return the phrase that will be spoken last.
