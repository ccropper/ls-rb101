# Write a method that takes one argument, a string, 
# and returns a new string with the words in reverse order.

def reverse_sentence(sentence)
  sentence.split.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

def reverse_words(sentence)
  words = sentence.split(' ')
  for word in words
    if word.length >= 5
      word.reverse!
    end
  end
  words.join(' ')
end

puts reverse_words('Professional')== 'lanoisseforP'
puts reverse_words('Walk around the block') == 'Walk dnuora the kcolb'
puts reverse_words('Launch School') == 'hcnuaL loohcS'