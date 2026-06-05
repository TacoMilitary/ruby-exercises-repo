# frozen_string_literal: true

def get_grade(*scores)
  case scores.sum / scores.size
  when 0...60 then 'F'
  when 60...70 then 'D'
  when 70...80 then 'C'
  when 80...90 then 'B'
  when 90...100 then 'A'
  else 'A+'
  end
end

p get_grade(95, 90, 93) == 'A'
p get_grade(50, 50, 95) == 'D'
p get_grade(95, 90, 93, 300) == 'A+'
