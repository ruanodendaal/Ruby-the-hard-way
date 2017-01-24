$user_name = ARGV.first
$user_input = "> "

# to get on the plane player must have opened
# the letter with the ticket inside
# user must answer correctly boolean expressions
# will create file with answers and has to match
# the plane's ticket machine
def airport

  puts "You have arrived at ex36 airport."
  puts "Last week you were sent a letter,"
  puts "should we open it? Yes or No"

  print $user_input
  choice = $stdin.gets.chomp.downcase

  if choice == "yes"
    target = open("letter.txt", 'r')
    print target.read
    puts ""
  elsif choice == "no"
    start
  else
    dead("Staring at airplanes made you sad.")
  end

  # 3 boolean questions
  puts "Please answer these 3 questions correctly"
  puts "What do these expressions evaluate to? True or False"

  # false
  puts "Q1: false && 0 != 0"
  # false
  puts "Q2: !('RO' == 'RO' || 10 < 5)"
  # true
  puts "Q3: 100 >= 50 && true"

  print "#{$user_input} Q1 answer: "
  first_answer = $stdin.gets.chomp.downcase
  print "#{$user_input} Q2 answer: "
  second_answer = $stdin.gets.chomp.downcase
  print "#{$user_input} Q3 answer: "
  third_answer = $stdin.gets.chomp.downcase

  formatter = "%{first}\n%{second}\n%{third}"

  # write the answers to the answer_file.txt
  answer_target = open("answer_file.txt", 'w+')
  answer_target.write(formatter % {first: first_answer, second: second_answer, third: third_answer})
  # closing file to be re-read later for comparison
  answer_target.close

  puts ""
  puts "Let's see if they match the boarding pass..."

  # compare answer_file.txt with boarding_pass.txt
  boarding = open("boarding_pass.txt", 'r')
  answer_target = open("answer_file.txt", 'r')

  if boarding.read == answer_target.read
    puts "Congratulations! You are correct,"
    puts "your answers match the boarding pass"
    # correct_questions = true
    puts ""
    puts "You can now fly home safe!"
    exit(0)
  elsif
    dead("Sorry you were wrong! Plane flies off without you")
  else
    puts "I go no idea what that means."
  end

target.close
end

# eaten alive
def wolf_pack
  puts "You've stumbled upon a pack of hungry wolves!"
  dead("They eat you alive!")
end

# jump in the volcano into the portal
# that transports you home
def mountain_volcano
  dead("mountain_volcano")
end

# user must answer correctly the array riddle
def forest_tribe
  puts "Welcome to the 'Forest Tribe' we must eat"
  puts "If you answer our array riddle correctly,"
  puts "we won't eat you and you will be our king "
  puts "But if you get it wrong, we spit roast you...mmm"
  puts "What do you think? Play or Run?"

  print $user_input
  choice = $stdin.gets.chomp.downcase

  if choice == "play"
    forest_game
  elsif choice == "run"
    start
  else
    dead("mmm spit roasted #{$user_name} is tasty")
  end
end


def forest_game
  animal = ["tiger", "bear", "wolf", "badger", "lion"]

  puts "We have an animal array, if you answer the array"
  puts "positions correctly you win"
  print animal
  puts
  correct_questions = 0

  while correct_questions < 2
    puts "Which position is wolf in?"
    print $user_input
    first_answer = $stdin.gets.chomp.to_i

    puts "Which position is tiger in?"
    print $user_input
    second_answer = $stdin.gets.chomp.to_i

    if animal[first_answer] == animal[2] && animal[second_answer] == animal[0]
      puts "You are correct"
      correct_questions += 2
    else
      puts "Sorry you did not answer them correctly"
      dead("mmm spit roasted #{$user_name} is tasty")
    end

    puts "You are our King!"
    exit(0)
  end
end


def dead(why)
  puts why, "You're dead!"
  exit(0)
end


def start
  puts """
  #{$user_name}, you're in the middle of a clearing
  surrounded by trees, it's a thick forest.
  But which way do you turn? North, South, East or West?
  """
  print $user_input
  choice = $stdin.gets.chomp.downcase

  if choice == "north"
    airport
  elsif choice == "south"
    wolf_pack
  elsif choice == "east"
    mountain_volcano
  elsif choice == "west"
    forest_tribe
  else
    dead("You must choose, now you've starved!!")
  end
end

start
