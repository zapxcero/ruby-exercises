def caesar_cipher(string, shift)
    char_arr = string.chars

    char_arr.map! do |w|
        ord = w.ord + shift
        if ord >=91 && ord <=97 || ord > 122
            w = (w.ord + shift - 26 ).chr
        elsif ord >= 65 && ord <=90 || ord >= 97 && ord<=122
            w = (w.ord + shift).chr
        else
            w = w
        end
    end
    char_arr.join("").to_s
end


puts caesar_cipher("What a string!", 5)