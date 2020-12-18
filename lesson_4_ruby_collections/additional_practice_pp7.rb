statement = "The Flintstones Rock"

# Create a hash that expresses the frequency with which each letter occurs in this string:
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

freq_hash = {}
for char in statement.chars
  if freq_hash.keys.include?(char)
    freq_hash[char] += 1
  else
    freq_hash[char] = 1
  end
end

p freq_hash

