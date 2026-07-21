# frozen_string_Literal: false

class Banner
  HORIZONTAL_PADDING = 1
  BANNER_CORNER = '+'
  BANNER_VERTICAL_BORDER = '|'
  BANNER_HORIZONTAL_BORDER = '-'

  attr_reader :raw_text, :display_text

  def initialize(message)
    self.raw_text = message
    self.display_text = format_banner.freeze
  end

  def to_s
    display_text
  end

  def display
    puts self
  end

  private

  attr_writer :raw_text, :display_text

  def format_banner
    padding = ' ' * HORIZONTAL_PADDING
    padded_text = "#{padding}#{raw_text}#{padding}"
    text_size = padded_text.size

    vertical_border = horizontal_rule(text_size)
    vertical_padding = empty_line(text_size)
    [vertical_border, vertical_padding, message_line(padded_text), vertical_padding, vertical_border].join "\n"
  end

  def horizontal_rule(text_size)
    border = BANNER_HORIZONTAL_BORDER * text_size
    "#{BANNER_CORNER}#{border}#{BANNER_CORNER}"
  end

  def empty_line(text_size)
    empty_space = ' ' * text_size
    "#{BANNER_VERTICAL_BORDER}#{empty_space}#{BANNER_VERTICAL_BORDER}"
  end

  def message_line(text_to_display)
    "#{BANNER_VERTICAL_BORDER}#{text_to_display}#{BANNER_VERTICAL_BORDER}"
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
