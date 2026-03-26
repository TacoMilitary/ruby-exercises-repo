# frozen_string_literal: true

def character_value(char)
  return nil unless char.is_a? String

  ('a'..'z').find_index(char.downcase)&.+(1)
end

p character_value('a')
p character_value('B')
p character_value('c')
p character_value('e')
p character_value('hehjj')
p character_value('jk')
p character_value('1')
p character_value(42)
