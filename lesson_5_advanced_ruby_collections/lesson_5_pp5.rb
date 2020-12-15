# Given this nested Hash:
# figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

male_munsters = munsters.select do |munster, attributes|
  attributes["gender"] == "male"
end
total_male_age = 0
male_munsters.each do |munster, attributes|
  total_male_age += attributes["age"]
end

p total_male_age


# LS solution: 

# total_male_age = 0
# munsters.each_value do |details|
#   total_male_age += details["age"] if details["gender"] == "male"
# end

# total_male_age # => 444