# frozen_string_literal: true

PLCHOLD_INFO = 'Unknown'

def valid_string(string)
  string.is_a?(String) && !string.empty? ? string : false
end

def valid_age(age)
  age.is_a?(Integer) && age.positive? ? age : false
end

def normalize(name, age, email)
  {
    name: valid_string(name) || PLCHOLD_INFO,
    age: valid_age(age) || PLCHOLD_INFO,
    email: valid_string(email) || PLCHOLD_INFO
  }
end

p normalize('Marcy', nil, '')

p normalize(nil, -1, 'best.user@gmail.com')
