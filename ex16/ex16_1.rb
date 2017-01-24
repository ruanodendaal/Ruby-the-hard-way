filename = ARGV.first

puts "Lets read that file: #{filename}"
target = open(filename)

print target.read
target.close
