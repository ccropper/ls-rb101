def digit_list(num)
  digits = num.to_s
  digits_arr = digits.split('')
  digits_arr = digits_arr.map {|d| d.to_i}
end


puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true