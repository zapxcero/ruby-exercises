# frozen_string_literal: true

def caesar_cipher(string, shift)
  char_arr = string.chars

  char_arr.map! do |w|
    ord = w.ord + shift

    w = if ord >= 91 && ord <= 97 || ord > 122

          (w.ord + shift - 26).chr

        elsif ord >= 65 && ord <= 90 || ord >= 97 && ord <= 122

          (w.ord + shift).chr

        else

          w

        end
  end

  char_arr.join('').to_s
end

puts caesar_cipher('What a string!', 5)
