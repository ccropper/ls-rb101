# Given the following data structure, 
# return a new array containing the same sub-arrays as the original 
# but ordered logically by only taking into consideration the odd numbers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

expected = [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

sorted_arr = arr.sort do |a, b|
  a.select {|n| n.odd?} <=> b.select {|n| n.odd?}
end

p sorted_arr
p sorted_arr == expected