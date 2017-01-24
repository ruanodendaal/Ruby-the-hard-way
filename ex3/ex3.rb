# Prints text to the screen
puts "I will count my chickens:"

# Prints Hens & performs the calculation in the {}
puts "Hens #{25 + 30 / 6}"
# Same as above
puts "Roosters #{100 - 25 * 3 % 4}"

puts "Now I will count the eggs:"

#PEDMAS, Parentheses Exponents Multiplication Division Addition Subtraction
puts 3 + 2 + 1 - 5 + 4 % 2 - 1 / 4.to_f + 6

puts "Is it true that 3 + 2 < 5 -7?"
# Prints false because its calculating the result
puts 3 + 2 < 5 - 7

# Asks the question and then prints the answer
puts "What is 3 + 2? #{3 + 2}"
puts "What is 5 - 7? #{5 - 7}"

puts "Oh, that's why it's false."

puts "How about some more."

# Same as above with different operators
puts "Is it greater? #{5 > -2}"
puts "Is it greater or equal? #{5 >= -2}"
puts "Is it less or equal? #{5 <= -2}"
