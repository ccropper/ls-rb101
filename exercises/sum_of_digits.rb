# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

def sum(n)
  n_str_arr = n.to_s.split('')
  sum = 0
  n_str_arr.each do |str|
    sum += str.to_i
  end
  sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45