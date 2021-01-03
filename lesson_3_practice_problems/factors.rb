=begin 
Alyssa noticed that this will fail if the input is 0, or a negative 
number, and asked Alan to change the loop. How can you make this work 
without using begin/end/until?
=end

=begin
factors should find return all the factors of a given number  

=end


def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

