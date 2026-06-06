# frozen_string_literal: true

def output_light_state(lights)
  text = case lights.size
         when 0 then 'No lights are left on.'
         when 1 then "Only light #{lights.first} is left on."
         when 2 then "Only lights #{lights.first} and #{lights.last} are left on."
         else
           lights_string = "#{lights[..-2].join(', ')} and #{lights.last}"
           "Lights #{lights_string} are left on."
         end
  puts text
end

def lights_toggle(times)
  lights = [true] * times
  (2..times).each do |iteration|
    lights.each_with_index do |status, light_num|
      lights[light_num] = !status if (light_num.next % iteration).zero?
    end
  end

  lights_on = lights.filter_map.with_index { |status, light_num| light_num.next if status }
  output_light_state(lights_on)
  lights_on
end

p lights_toggle(5) == [1, 4]
p lights_toggle(10) == [1, 4, 9]
