require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text'

class TextTest < Minitest::Test
  attr_reader :file, :file_text, :text

  def setup
    @file = File.open('sample_text.txt')
    @file_text = file.read.delete("\r")
    @text = Text.new file_text
  end

  def test_replace_a_e
    expected = <<~EXPECT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    EXPECT

    assert_equal(expected, text.swap('a', 'e'))
  end

  def test_word_count
    assert_equal(file_text.split.count, text.word_count)
    assert_equal(72, text.word_count)
  end

  def teardown; file.close; end
end
