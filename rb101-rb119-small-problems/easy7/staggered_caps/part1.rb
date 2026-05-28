# frozen_string_literal: true

def staggered_case(string)
  (0...string.length).step(2).with_object(string.downcase) do |index, new_str|
    new_str[index] = new_str[index].upcase
  end
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
