=begin

Ben was tasked to write a simple ruby method to determine 
if an input string is an IP address representing dot-separated 
numbers. e.g. "10.4.5.11". He is not familiar with regular 
expressions. Alyssa supplied Ben with a method called 
is_an_ip_number? that determines if a string is a numeric 
string between 0 and 255 as required for IP numbers and asked 
Ben to use it.

Alyssa reviewed Ben's code and says "It's a good start, 
but you missed a few things. You're not returning a false 
condition, and you're not handling the case that there 
are more or fewer than 4 components to the IP address 
(e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."
=end


def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while (1..4).cover?(dot_separated_words.size) do
    word = dot_separated_words.pop
    break if is_an_ip_number?(word)
    return false
  end
  return true
end