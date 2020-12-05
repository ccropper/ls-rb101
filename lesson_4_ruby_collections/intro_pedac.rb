# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []



# clarifying questions:
#   what's a palindrome?
#   should spaces be considered in a special way?
#   will inputs always be strings?  


# input: string
# output: array with string elements

# rules:

# -- explicit: 
#       all the palindrome substrings should be outputted
#       palindrome words are case-sensitive
#       return ALL palindrome substrings, even "overlapping" ones

# -- implicit:
#       empty string should return empty array
#       string with no palindromes should return empty array
#       string input may not represent a sentence
