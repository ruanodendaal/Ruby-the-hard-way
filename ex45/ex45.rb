require "./file_manipulations.rb"
$user_name = ARGV.first

class Scene
  def enter()
    puts "This scene has not yet been configured"
    exit(1)
  end
end


class Engine

  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene('finished')

    while current_scene != last_scene
      next_scene_name = current_scene.enter()
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    current_scene.enter()
    print last_scene
  end
end


class Death < Scene

  def enter()
    puts "You're dead!"
    exit(1)
  end
end


class Clearing < Scene

  def enter()
    puts """
    #{$user_name}, you're in the middle of a clearing
    surrounded by trees, it's a thick forest.
    But which way do you turn? North, South, East or West?
    """
    print $user_input
    choice = $stdin.gets.chomp.downcase

    if choice == "south"
      return 'wolf_pack'
    elsif choice == "east"
      return 'forest_tribe'
    elsif choice == "north"
      return 'clearing'
    elsif choice "west"
      return 'clearing'
    else
      return 'death'
    end
  end
end


# user must answer correctly the array riddle
class ForestTribe < Scene

  def enter()
    puts
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
      return 'clearing'
    else
      puts "mmm spit roasted #{$user_name} is tasty"
      return 'death'
    end
  end


  def forest_game
    animal = ["tiger", "bear", "wolf", "badger", "lion"]
    correct_questions = 0

    while correct_questions < 2
      puts
      puts "We have an animal array, if you answer the array"
      puts "positions correctly you will be allowed to pass"
      print animal
      puts
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
        puts "mmm spit roasted #{$user_name} is tasty"
        puts
        return 'death'
      end
    end
    return 'volcano'
  end
end


# must defeat a troll half way up with a club
class Volcano < Scene

  def enter()
    puts
    puts "You've reached the foot of a volcano, you start"
    puts "climb it. Half way up you see a troll."
    puts "He challenges you to a riddle."

    puts "Complete the expression so that evaluates to false:"
    puts "(x + 7 < y + 10) || (z % 2 > 2**3)"
    print "x: "
    x = $stdin.gets.chomp.to_i
    print "y: "
    y = $stdin.gets.chomp.to_i
    print "z: "
    z = $stdin.gets.chomp.to_i
    result = (x + 7 < y + 10) || (z % 2 > 2**3)

    if result == false
      puts "You are correct!"
      return 'volcano_portal'
    else
      puts "That is incorrect, now I will eat you for lunch!"
      return 'death'
    end

    return 'death'
  end
end


# jump in the volcano into the portal
# that transports you to the airport
class VolcanoPortal < Scene

  def enter()
    puts
    puts "You've reached the top of the Volcano!"
    puts "There doesn't seem like anywhere to go."
    puts "Except that inside the volcano there seems"
    puts "to be a portal of some kind, it looks like it"
    puts "takes you somewhere. Do you jump in?"

    loop do
      print "> "
      choice = $stdin.gets.chomp.downcase
      if choice == "yes"
        puts "You jump and are transported to another dimension..."
        puts "the airport"
        return 'airport'
      elsif choice == "no"
        puts "You starve from boredom!"
        return 'death'
      else
        puts "That's not an option!"
      end
    end
  end
end


# to get on the plane player must have opened
# the letter with the ticket inside
# user must answer correctly boolean expressions
# will create file with answers and has to match
# the plane's ticket machine i.e. boarding pass
class Airport < Scene

  def enter()
    puts
    puts "You have arrived at a made up airport."
    puts "Last week you were sent a letter,"
    puts "should we open it? Yes or No"

    print $user_input
    choice = $stdin.gets.chomp.downcase

    if choice == "yes"
      target = open("letter.txt", 'r')
      print target.read
      puts ""
    elsif choice == "no"
      return 'clearing'
    else
      return 'death'
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

    # write the answers to the answer_file.txt for comparison
    answer_target = open("answer_file.txt", 'w+')
    answer_target.write(formatter % {first: first_answer, second: second_answer, third: third_answer})
    answer_target.close

    puts ""
    puts "Let's see if they match the boarding pass..."
    answer = "answer_file.txt"
    boarding = "boarding_pass.txt"

    if FileManipulations.file_compare(boarding, answer) == true
      puts "Congratulations! You are correct,"
      puts "your answers match the boarding pass"
      puts ""
      puts "You can now fly home safe!"
      return 'airport_runway'
    else
      return 'death'
    end

  target.close
  end
end


class AirportRunway < Scene

  def enter()
    puts
    puts "You make it through the boarding gate but"
    puts "when you get to the plan there seems to be"
    puts "a keypad! The plane is about to leave so"
    puts "you have no choice but to guess the code!"
    puts "It's a random combination 1-3"
    code = "#{rand(1..3)}#{rand(1..3)}#{rand(1..3)}"
    print "[keypad]> "
    guess = $stdin.gets.chomp
    guesses = 1

    while guess != code && guesses < 10
      puts "BZZZZEDDD!"
      guesses += 1
      print "[keypad]> "
      guess = $stdin.gets.chomp
    end

    if guess == code
      puts "That is the correct code...lets go home!"
      puts "-" * 10
      return 'finished'
    else
      puts "You've had too many attempts, "
      puts "The plane leaves without you!"
      return 'death'
    end
  end
end


# To pass the wolves the player must throw them some meat
# then takes them to the forest tribe
class WolfPack < Scene

  def enter()
    puts
    puts "You've stumbled upon a pack of hungry wolves!"
    puts "They've just killed a deer and it's lying in"
    puts "front of you."
    puts "They are between you and the path through."
    puts "How are you going to move them?"
    wolves_moved = false

    loop do
      print "> "
      choice = $stdin.gets.chomp

      if choice == "run away"
        puts "The wolves chase you and eat your face off!"
        return 'death'
      elsif choice == "throw meat" && !wolves_moved
        puts "The wolves have moved, you can run past."
        wolves_moved = true
      elsif choice == "throw meat" && wolves_moved
        puts "The wolves gets pissed off and chew your leg off."
        return 'death'
      elsif choice == "run past" && wolves_moved
        return 'forest_tribe'
      else
        puts "I go no idea what that means."
      end
    end
  end
end


class Finished

  def enter()
    puts "Congratualtions, you've won"
    exit(0)
  end
end



class Map

  @@scenes = {
    'clearing' => Clearing.new(),
    'airport' => Airport.new(),
    'airport_runway' => AirportRunway.new(),
    'forest_tribe' => ForestTribe.new(),
    'wolf_pack' => WolfPack.new(),
    'volcano' => Volcano.new(),
    'volcano_portal' => VolcanoPortal.new(),
    'death' => Death.new(),
    'finished' => Finished.new(),
  }

  def initialize(start_scene)
    @start_scene = start_scene
  end

  def next_scene(scene_name)
    val = @@scenes[scene_name]
    return val
  end

  def opening_scene()
    return next_scene(@start_scene)
  end
end


a_map = Map.new('clearing')
a_game = Engine.new(a_map)
a_game.play()
