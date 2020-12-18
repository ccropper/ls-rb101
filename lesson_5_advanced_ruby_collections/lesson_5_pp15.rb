# Given this data structure write some code to return an array 
# which contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

expected = [{e: [8], f: [6, 10]}]

=begin
  
P 
explicit: 
- return an array
- array should contain hashes
- hashes returned be ones where all integer elements are even
implicit:
- don't return empty hashes
- return the hash as is if it meets criteria

E

expected = [{e: [8], f: [6, 10]}]

D

working with an outer array
elements are hashes which have symbols for keys and may contain multiple arrays as values

A

how would i do this as a human?
look at each hash in the array
look through each value (array) in the hash to see if all elements are even
if all elements are even, then that hash meets criteria and stays
if any odd elements are found in the value (array), then the whole hash is disqualified

loop through each hash_element of arr
  for each hash_element, check all values to see if any are not even
    if any are not even, return false
    else return true
return boolean array the same length as original arr
use boolean arr to determine select which hash_elements of original arr to keep

C

arr.select do |hsh_el|
  hsh_el.values.flatten
  if each.values.flatten.any? are odd
    false
  else 
    true

=end


even_hsh_arr = arr.select do |hsh_el|
  flat_hsh_vals = hsh_el.values.flatten
  flat_hsh_vals.all? {|n| n.even?}
end

p even_hsh_arr
p even_hsh_arr == expected
  

