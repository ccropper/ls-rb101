# What happens when we modify an array while we are iterating over it? 
# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

=begin
  
In our first example, the removal of the first item in the first pass 
changes the value found for the second pass.

In our second example, we are shortening the array each pass just as 
 the first example...but the items removed are beyond the point we 
 are sampling from in the abbreviated loop.

In both cases we see that iterators DO NOT work on a copy of the 
original array or from stale meta-data (length) about the array. 
They operate on the original array in real time.

=end
