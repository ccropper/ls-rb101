vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

=begin

Instructions:

Write a method that counts the number of occurrences of each element in a given array.
The words in the array are case-sensitive: 'suv' != 'SUV'. 
Once counted, print each element alongside the number of occurrences.

P

input: array of vehicles with duplicates
output: printing of each element with count

explicit rules: 
- words in the array are case-sensitive
- array of words (strings)
- keep track of occurrences of words
- print the counts
implicit rules:
- probably store in a hash
- return value not mentioned - assume nil

E 

see example

D

- provided an array
- need to keep count in a hash

A

- iterate through each element in the given list
- start a counter for each word:
  - if first time, create a new counter for that word
  - if not first time, add 1 to the counter for that word
- once done iterating through elements in the given list, print the results 

C

create counter hash
for word in array:
  if word is in the keys of the counter hash:
    increment value of counter hash by 1
  if word is not in the keys of the counter hash:
    add word as key in counter hash and set counter to 1
print string representation of counter hash

=end

def count_occurrences(list)
  counts = {}
  for word in list
    if counts.keys.include?(word)
      counts[word] += 1
    else
      counts[word] = 1
    end
  end
  counts.each {|k, v| puts "#{k} => #{v}"}
end

 count_occurrences(vehicles)
