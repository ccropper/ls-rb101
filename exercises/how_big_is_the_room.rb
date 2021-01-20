# Build a program that asks a user for the length and width of a room in meters 
# and then displays the area of the room in both square meters and square feet.
# Note: 1 square meter == 10.7639 square feet
# Do not worry about validating the input at this time.

SQ_M_TO_SQ_F = 10.7639

puts "Enter the length of the room in meters:"
room_length_m = gets.chomp.to_f
puts "Enter the width of the room in meters:"
room_width_m = gets.chomp.to_f
room_area_sq_m = room_length_m * room_width_m
room_area_sq_ft = room_area_sq_m * SQ_M_TO_SQ_F
puts "The area of the room is #{'%.0f' % room_area_sq_m} square meters " \
     "(#{'%.0f' % room_area_sq_ft} square feet)."