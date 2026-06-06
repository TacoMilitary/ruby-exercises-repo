# frozen_string_literal: true

def lights_toggle(times)
  lights = [true] * times
  (2..times).each do |iteration|
    lights.each_with_index do |status, light_num|
      lights[light_num] = !status if (light_num.next % iteration).zero?
    end
  end

  lights.filter_map.with_index { |status, light_num| light_num.next if status }
end


p lights_toggle(5) == [1, 4]
p lights_toggle(10) == [1, 4, 9]
