# Given this data structure, return a new array of the same structure 
# but with the sub arrays being ordered (alphabetically or numerically as appropriate) 
# in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# P - I would clarify if this means the elements within the subarray or the subarrays themselves;
# by the letter of the word, the prompt describes the sub arrays

sorted_arr = arr.map do |sub_arr|
  sub_arr.sort.reverse
end

p sorted_arr

# # suggested solution: 
# arr.map do |sub_arr|
#   sub_arr.sort do |a, b|
#     b <=> a
#   end
# end
# # => [["c", "b", "a"], [3, 2, 1], ["green", "blue", "black"]]

