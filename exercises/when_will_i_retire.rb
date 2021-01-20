# Build a program that displays when the user will retire 
# and how many years she has to work till retirement.

print "What is your age? "
current_age = gets.chomp.to_i
print "At what age would you like to retire? "
retire_age = gets.chomp.to_i

year_gap = retire_age - current_age
this_year = Time.now.year
retire_year = this_year + year_gap

puts "It's #{this_year}. You will retire in #{retire_year}. "
puts "You only have #{year_gap} years of work to go!"

