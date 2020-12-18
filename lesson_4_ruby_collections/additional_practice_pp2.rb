ages = { "Herman" => 32, 
         "Lily" => 30, 
         "Grandpa" => 5843, 
         "Eddie" => 10, 
         "Marilyn" => 22, 
         "Spot" => 237 }

# Add up all of the ages from the Munster family hash:

total_age = 0
ages.each {|who, age| total_age += age}
p total_age