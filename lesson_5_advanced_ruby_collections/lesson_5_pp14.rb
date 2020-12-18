# Given this data structure write some code to return an array containing the colors of the fruits 
# and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

expected_arr = [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]


new_arr = hsh.map do |produce, attributes|
  if attributes[:type] == 'fruit'
    attributes[:colors].map {|color| color.capitalize!}
  elsif attributes[:type] == 'vegetable'
    attributes[:size].upcase
  end
end


p new_arr
p new_arr == expected_arr

