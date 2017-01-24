def while_num(i, nums, increment)
  numbers = []

  (i..nums.to_i).each {
    puts "At the top is #{i}"
    numbers << i

    i += increment.to_i
    puts "Numbers now: ", numbers
    puts "At the bottom i is #{i}"
    puts "--------------"
  }

  puts "The numbers: "
  numbers.each { |num| puts num }
end

puts "How many numbers shall we go to?"
user_num = $stdin.gets.chomp
puts "How much should we increment by?"
increment = $stdin.gets.chomp

while_num(0, user_num, increment)
