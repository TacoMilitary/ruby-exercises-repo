# frozen_string_literal: true

ALPHABET_NOCASE = (('A'..'Z').to_a + ('a'..'z').to_a).freeze

def staggered_case(string)
  upper_next = true
  string.each_char.with_object(''.dup) do |chr, stag_string|
    if ALPHABET_NOCASE.include?(chr)
      chr = (upper_next ? chr.upcase : chr.downcase)
      upper_next = !upper_next
    end

    stag_string << chr
  end
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
