# frozen_string_literal: true

def caesar_cipher(message, shift)
  char_arr = message.chars

  char_arr.map! do |c|
    ord = c.ord + shift
    if ord.between?(91, 97) || ord > 122
      (c.ord + shift - 26).chr
    elsif ord.between?(65, 95) || ord.between?(97, 122)
      (c.ord + shift).chr
    else
      c
    end
  end

  char_arr.join('').to_s
end

puts caesar_cipher('What a string!', 5)
