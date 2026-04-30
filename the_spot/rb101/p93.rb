# frozen_string_literal: true

PLCHOLD_INFO = 'Unknown'

def normalize(name, age, email)
  {
    name: name || PLCHOLD_INFO,
    age: age || PLCHOLD_INFO,
    email: email || PLCHOLD_INFO
  }
end

p normalize('Marcy', nil, nil)

p normalize(nil, nil, 'best.user@gmail.com')
