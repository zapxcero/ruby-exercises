def max_diff_pair(array)
    max_diff = array[1]-array[0]
    buy_day = 0
    sell_day = 0
    for i in 0..array.length
        for j in i+1..array.length
            unless array[j] == nil
                if (array[j] - array[i]) > max_diff
                    max_diff = array[j] - array[i]
                    buy_day = i
                    sell_day = j
                end
            end
        end
    end
    [buy_day, sell_day]
end

max_diff_pair([17,3,6,9,15,8,6,1,10])