# frozen_string_literal: true

def max_diff_pair(array)
  max_diff = array[1] - array[0]
  buy_day = 0
  sell_day = 0
  (0..array.length).each do |i|
    (i + 1..array.length).each do |j|
      next unless !array[j].nil? && ((array[j] - array[i]) > max_diff)

      max_diff = array[j] - array[i]
      buy_day = i
      sell_day = j
    end
  end
  [buy_day, sell_day]
end

max_diff_pair([17, 3, 6, 9, 15, 8, 6, 1, 10])
