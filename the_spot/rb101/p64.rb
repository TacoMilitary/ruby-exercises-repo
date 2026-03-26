#  frozen_string_literal: true

input_hash = { a: [1, 2, 3], b: [4, 5, 6] }
# Transformed hash: { a: [0, 0, 0], b: [0, 0, 0] }

def non_mutating_transform(hash)
  hash.transform_values do |value|
    value.is_a?(Array) ? Array.new(value.size, 0) : value
  end
end

def partial_mutating_transform(hash)
  hash.each do |key, value|
    hash[key] = value.map { 0 } if value.is_a? Array
  end
end

def mutating_transform(hash)
  hash.each do |_, value|
    value.map! { 0 } if value.is_a? Array
  end
end

p input_hash
p non_mutating_transform input_hash
p input_hash
