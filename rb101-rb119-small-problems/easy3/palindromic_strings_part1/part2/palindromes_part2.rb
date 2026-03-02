# frozen_string_literal: true

def alpha_numerics_only(str)
  case_ignore_str = str.dup.downcase
  characters = case_ignore_str.split('').delete_if do |c| 
    !(('a'..'z').include?(c) || ('0'..'9').include?(c))
  end

  characters.join
end

def real_palindrome?(str)
  alphanumeric_string = alpha_numerics_only(str).downcase
  reversed_alphanumeric = alphanumeric_string.reverse
  
  alphanumeric_string == reversed_alphanumeric
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
