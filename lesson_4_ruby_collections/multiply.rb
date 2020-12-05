# def multiply(numbers, multiplier)
#   numbers = numbers.map {|n| n*multiplier}
#   return numbers
# end


# using loop
def multiply(numbers, multiplier)
   numbers_multiplied = []
   counter = 0

   loop do
     break if counter == numbers.length

     numbers_multiplied.append(numbers[counter]*multiplier)
     counter += 1
   end
    
  return numbers_multiplied
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) == [3, 12, 9, 21, 6, 18]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
p my_numbers