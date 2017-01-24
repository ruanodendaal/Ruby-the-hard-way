name = 'Zed A. Shaw'
age = 35 # not a lie in 2009
height = 74 # inches
weight = 180 # lbs
kilo_weight = weight * 0.453592
eyes = 'Blue'
teeth = 'White'
hair = 'Brown'



puts "Let's talk about  #{name}."
puts "He's #{height} inches tall, thats #{height * 2.54} centimeters tall."
puts "He's #{weight} pounds heavy, thats #{sprintf("%.2f", kilo_weight)} kilograms heavy."
puts "#{kilo_weight}"
puts "Actually that's not too heavy."
puts "He's got #{eyes} eyes and #{hair} hair."
puts "His teeth are usually #{teeth} depending on the coffee."

puts "If I add #{age}, #{height}, and #{weight} I get #{age + height + weight}."
