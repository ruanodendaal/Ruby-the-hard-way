user_name, second = ARGV
user_input = '> '

puts "Hi #{user_name}, your #{second} years old."
puts "I'd like to ask you a few questions."
puts "Do you like me #{user_name}? "
puts user_input
likes = $stdin.gets.chomp
puts "Where do you live #{user_name}? "
puts user_input
lives = $stdin.gets.chomp

#a comma for puts it like using it twice
puts "What kind of computer do you have? ", user_input
computer = $stdin.gets.chomp

puts """
Alright, so you said #{likes} about liking me.
You live in #{lives}. Not sure where that is.
And you have a #{computer} computer. Nice
"""
