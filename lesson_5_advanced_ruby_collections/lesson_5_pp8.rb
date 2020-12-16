# Using the each method, write some code to output all of the vowels from the strings.


hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = %w(a e i o u) # can also be vowels = 'aeiou'
hsh.each do |_ , words| # we don't care about the keys, so we use _
  words.each do |word|
    word.chars.each do |char|
      if vowels.include?(char)
        puts char
      end
    end
  end
end
