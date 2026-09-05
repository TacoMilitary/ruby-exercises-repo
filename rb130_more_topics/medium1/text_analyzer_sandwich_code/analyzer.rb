# waht is a paragraph

class TextAnalyzer
  def process(file_path)
    text = IO.read file_path
    puts yield(text)
  end
end

TEST_FILE = 'text.txt'

analyzer = TextAnalyzer.new

analyzer.process(TEST_FILE) do |text|
  paragraph_count = text.delete("\r").split("\n\n").size
  "#{paragraph_count} paragraphs"
end

analyzer.process(TEST_FILE) do |text|
  lines_count = text.scan(/^.*$/).size
  "#{lines_count} lines"
end

analyzer.process(TEST_FILE) do |text|
  word_count = text.scan(/[a-z]+/).size
  "#{word_count} words"
end
