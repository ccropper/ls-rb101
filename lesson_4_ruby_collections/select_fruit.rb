=begin
  
# P 
- input: hash, 
- output: hash
- take in a hash
- subset the hash to only where the value is "Fruit"

# E
- select_fruit(produce) == {"apple"=>"Fruit", "pear"=>"Fruit"}

# D
- hash

# A
- take in the hash
- create a result hash
- loop through items in the hash, and, if the value is Fruit, then add to result hash
- return result hash

# C
- establish empty result hash
- abstract out hash keys as own array
- set counter
- loop through the hash using keys from array
  - if value == Fruit
  - assign key, value pair to result hash
  - increment counter
- return result hash

=end



def select_fruit(produce_hash)
  fruits = {}
  specific_produce = produce_hash.keys
  counter = 0
  loop do 
    break if counter == specific_produce.size
    if produce_hash[specific_produce[counter]] == 'Fruit'
      fruits[specific_produce[counter]] = produce_hash[specific_produce[counter]]
    end
    counter += 1
  end
  fruits
end


produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

p "test passes: #{select_fruit(produce) == {"apple"=>"Fruit", "pear"=>"Fruit"}}"
p produce