flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

p flintstones.index {|person| person[0, 2] == "Be"}