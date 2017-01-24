=begin
print "Give me a number: "
number = gets.chop.to_i

bigger = number * 100
puts "A bigger number is #{bigger}"

print "Give me another number: "
another = gets.chomp
number = another.to_i

smaller = number / 100
puts "A smaller number is #{smaller}"
=end

cash = ARGV.first
puts "Here's 10% $#{cash.to_f * 0.1} of your cash"

print "How much do you want? "
money = $stdin.gets.chomp.to_f
change = money * 1.1
puts "Here is 110% back #{sprintf('%.2f', change)}"
