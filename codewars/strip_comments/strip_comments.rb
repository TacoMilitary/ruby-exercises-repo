# frozen_String_literal: true

# Solution 1
=begin
def strip_comments(string, comment_chars)
  comment_regex = comment_chars.join('|')
  lines = string.split /\s*[#{comment_regex}].*$/
  p lines.join "\n"
end
=end

# Solution 2 (doesnt work)
def strip_comments(string, markers)
  markers << '$'
  comment_class = "(?=\s?(?:#{markers.join('|')}))"
  lines = string.scan /(^.*?#{comment_class})/
  lines.join "\n"
end

p strip_comments("apples, pears # and bananas\ngrapes\nbananas !apples", ["#", "!"])
