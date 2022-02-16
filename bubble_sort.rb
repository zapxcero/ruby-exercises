def bubble_sort(array)
    for i in (0..array.length)
        for j in (i+1..array.length)
            unless array[j] == nil
                if array[i] > array[j]
                    temp = array[j]
                    array[j] = array[i]
                    array[i] = temp
                end
            end
        end
    end
    array
end





p bubble_sort([4,3,78,2,0,2])