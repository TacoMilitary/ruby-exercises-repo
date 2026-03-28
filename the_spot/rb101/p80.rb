# frozen_string_literal: true

def tally_truthiness(arr)
  truthiness_hash = Hash.new(0)
  arr.each do |object| 
    key = object ? 'truthy' : 'falsy'
    truthiness_hash[key] += 1
  end
  truthiness_hash
end

def truthy?(object)
  return false if object.is_a?(Numeric) && object.zero?
  is_collection = object.is_a?(Array) || object.is_a?(String) || object.is_a?(Hash)
  return false if is_collection && object.empty?
  !!object
end

def tally_custom_truthiness(arr)
  truthiness_hash = Hash.new(0)
  arr.each do |object| 
    key = truthy?(object) ? 'truthy' : 'falsy'
    truthiness_hash[key] += 1
  end
  truthiness_hash
end

def truthy_array(arr)
  arr.all? { |object| !!object }
  # Makes it explicit that we want to evaluate the truthiness.
end

puts tally_custom_truthiness([1, 2, 'foo', nil, 'false', 0, []])
# Expected output: { 'truthy' => 4, 'falsy' => 1 }
