=begin
filename = ARGV.first

txt = open(filename)

puts "Here's your file #{filename}:"
print txt.read
=end

print "Type the filename you want to read: "
file_again = $stdin.gets.chomp

txt_again = open(file_again)

print txt_again.read
