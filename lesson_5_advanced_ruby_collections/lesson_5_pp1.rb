arr = ['10', '11', '9', '7', '8']

arr.map! {|n| n.to_i}
arr.sort!.reverse!
arr.map! {|n| n.to_s}

p arr

# better solution:

# arr.sort do |a,b|
#   b.to_i <=> a.to_i
# end
