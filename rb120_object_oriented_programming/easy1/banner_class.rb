# frozen_string_Literal: false

class Banner
  HORIZONTAL_PADDING = 1
  BANNER_CORNER = '+'
  BANNER_VERTICAL_BORDER = '|'
  BANNER_HORIZONTAL_BORDER = '-'

  def initialize(message)
    self.raw_text = message
    padding = ' ' * HORIZONTAL_PADDING
    self.padded_text = "#{padding}#{raw_text}#{padding}"
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join "\n"
  end

  def display
    puts self
  end

  private

  attr_accessor :padded_text
  attr_accessor :raw_text

  def horizontal_rule
    border = BANNER_HORIZONTAL_BORDER * padded_text.size
    "#{BANNER_CORNER}#{border}#{BANNER_CORNER}"
  end

  def empty_line
    empty_space = ' ' * padded_text.size
    "#{BANNER_VERTICAL_BORDER}#{empty_space}#{BANNER_VERTICAL_BORDER}"
  end

  def message_line
    "#{BANNER_VERTICAL_BORDER}#{padded_text}#{BANNER_VERTICAL_BORDER}"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
banner.display
# +--+
# |  |
# |  |
# |  |
# +--+
