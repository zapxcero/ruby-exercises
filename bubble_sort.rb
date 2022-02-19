# frozen_string_literal: true

def bubble_sort(array)
  (0..array.length).each do |i|
    (i + 1..array.length).each do |j|
      next unless !array[j].nil? && (array[i] > array[j])

      temp = array[j]

      array[j] = array[i]

      array[i] = temp
    end
  end

  array
end

p bubble_sort([4, 3, 78, 2, 0, 2])
