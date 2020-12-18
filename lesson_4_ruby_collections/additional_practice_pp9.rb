words = "the flintstones rock"

# Write your own version of the rails titleize implementation.
# words = "The Flintstones Rock"

split_words = words.split(" ")
split_words.each do |word|
  word[0] = word[0].upcase
end
titleized_words = split_words.join(' ')
p titleized_words
