def encode_rail_fence_cipher(str, num_rails)
  num_rails.times.with_object('') do |rail, cipher|
    gap = rail.next == num_rails ? (num_rails.pred * 2) : (num_rails - rail.next) * 2
    puts gap
    (rail...str.size).step(gap) { |index| cipher << str[index] }
  end
end

def decode_rail_fence_cipher(str, num_rails)
  # your code here...
end

#p encode_rail_fence_cipher('', 3) == ''
#p decode_rail_fence_cipher('', 3) == ''

#p encode_rail_fence_cipher('WEAREDISCOVEREDFLEEATONCE', 3) == 'WECRLTEERDSOEEFEAOCAIVDEN'
#p decode_rail_fence_cipher('WECRLTEERDSOEEFEAOCAIVDEN', 3) == 'WEAREDISCOVEREDFLEEATONCE'

p encode_rail_fence_cipher('WEAREDISCOVEREDFLEEATONCE', 4) == 'WIREEEDSEEEACAECVDLTNROFO'
p encode_rail_fence_cipher('WEAREDISCOVEREDFLEEATONCE', 4)
p 'WIREEEDSEEEACAECVDLTNROFO'
#p decode_rail_fence_cipher('WIREEEDSEEEACAECVDLTNROFO', 4) == 'WEAREDISCOVEREDFLEEATONCE'

# 3
# W       E       C       R       L       T       E
#   E   R   D   S   O   E   E   F   E   A   O   C  
#     A       I       V       D       E       N    
#
# 4
# v
# WEAREDISCOVEREDFLEEATONCE
# WIREEEDSEEEACAECVDLTNROFO
# W           I           R           E           E
#   E       D   S       E   E       E   A       C
#     A   E       C   V       D   L       T   N
#       R           O          F           O
# 5
# v
# W               C               L               E # X = 8
#   E           S   O           F   E           C   # X = 6
#     A       I       V       D       E       N     # X = 4
#       R   D           E   E           A   O       # X = 2
#         E               R               T         # X = 8

# N = 1; RG = 8
# N = 2; RG = 6
# N = 3; RG = 4
# N = 4; RG = 2
# N = 5; RG = 8

# The first R letters can be separated into individual rows.
# Rails = R
# G = Max possible gap between two letters.
# G = (R - 1) * 2
# Each ascending rail number decreases this G by 2.
# The final rail will go back up to max.
# N = Rail number. 1-R
# I = Current rail number gap between letters.
# I = (R - N) * 2
# I is how many indices we have to jump for a letter on our row.

# Iterate over each rail. Using num_rails#times
# Using the index, iterate over its character set.
# Range#step. Step the I gap.
# Add the current character index to the new string.
