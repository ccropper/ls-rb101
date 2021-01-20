# Create a simple tip calculator. 
# The program should prompt for a bill amount and a tip rate.
# The program must compute the tip and then display both the tip and the total amount of the bill.

print "What is the bill? "
bill = gets.chomp.to_f
print "What is the tip percentage? "
tip_perc = gets.chomp.to_f

tip_amt = (bill * tip_perc / 100).round(2)
total_amt = (bill + tip_amt).round(2)

puts "The tip is $#{tip_amt}."
puts "The total is #{total_amt}."