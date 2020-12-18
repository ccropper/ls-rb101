munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an 
# additional "age_group" key that has one of three values describing 
# the age group the family member is in (kid, adult, or senior). 
# Your solution should produce the hash below

banded_munsters = { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

=begin 
P 

input: hash
output: hash
explicit requirements:
- mutate the caller
- age_group rules: 
  - a kid is in the age range 0 - 17, 
  - an adult is in the range 18 - 64 and 
  - a senior is aged 65+.
implicit requirements:

E 

banded_munsters

D 

nested hash

A

take the munster family hash
for each munster, look at their age, and assign an age group

C

loop through the keys and values of the munsters hash
  for each munster, look at the value of "age"
    assign a new key-value pair to each munster based on ^
return the original hash

=end

def assign_age_group(age)
  if age < 18
    return "kid"
  elsif age > 64
    return "senior"
  else
    return "adult"
  end
end

munsters.each do |munster, attributes|
  attributes["age_group"] = assign_age_group(attributes["age"])
end

p munsters == banded_munsters
