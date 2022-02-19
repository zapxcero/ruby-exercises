# frozen_string_literal: true

def substrings(string, dict)
  hash = Hash.new(0)
  dict.each do |word|
    hash[word] = string.downcase.scan(word).length unless string
      .downcase
      .scan(word)
      .length
      .zero?
  end
  hash
end

p substrings(
    "Howdy partner, sit down! How's it going?",
    %w[below down go going horn how howdy it i low own part partner sit],
  )
