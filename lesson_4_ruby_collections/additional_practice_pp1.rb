flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and 
# the values are the positions in the array.

# create new hash
# iterate through each element in flintstones with index
# for each element and index,
#   set element as key and index as value
# return hash

flintstones_order = {}
flintstones.each_with_index do |name, ix|
  flintstones_order[name] = ix
end

p flintstones_order