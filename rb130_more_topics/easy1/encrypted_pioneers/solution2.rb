# frozen_string_literal: false

LETTER_REGEX = /[a-z]/i
LETTERS_ARRAY = ('a'..'z').to_a

def decrypt_name(name)
  name.gsub(LETTER_REGEX) do |letter|
    new_index = LETTERS_ARRAY.index(letter.downcase) + 13
    rot13_letter = LETTERS_ARRAY[new_index % LETTERS_ARRAY.size]
    letter == letter.upcase ? rot13_letter.upcase : rot13_letter
  end
end

p decrypt_name('Nqn Ybirynpr')
p decrypt_name('Tenpr Ubccre')
p decrypt_name('Nqryr Tbyqfgvar')
p decrypt_name('Nyna Ghevat')
p decrypt_name('Puneyrf Onoontr')
p decrypt_name('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p decrypt_name('Wbua Ngnanfbss')
p decrypt_name('Ybvf Unvog')
p decrypt_name('Pynhqr Funaaba')
p decrypt_name('Fgrir Wbof')
p decrypt_name('Ovyy Tngrf')
p decrypt_name('Gvz Orearef-Yrr')
p decrypt_name('Fgrir Jbmavnx')
p decrypt_name('Xbaenq Mhfr')
p decrypt_name('Fve Nagbal Ubner')
p decrypt_name('Zneiva Zvafxl')
p decrypt_name('Lhxvuveb Zngfhzbgb')
p decrypt_name('Unllvz Fybavzfxv')
p decrypt_name('Tregehqr Oynapu')
