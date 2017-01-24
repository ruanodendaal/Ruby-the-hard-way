class Scene
  def enter()
    puts "This scene is not yet configured. Subclass it and implement enter()."
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

    # be sure to print out the last scene
    current_scene.enter()
  end
end


class Death < Scene

  @@quips = [
    "You died. You kinda suck at this.",
    "Your mom would be proud...if she were smarter.",
    "Such a luser.",
    "I have a small puppy that's better at this."
  ]

  def enter()
    puts @@quips[rand(0..(@@quips.length - 1))]
    exit(1)
  end
end

class CentralCorridor < Scene
  # This is the starting point and has a Gothon
  #already standing there they have to defeat
  #with a joke before continuing.
  def enter()
    puts "You've walked into the 'Central Corridor'. "
    puts "There is a Gothon standing there"
    puts "What do you do? Shoot! Dodge! or Tell a joke?"
    print "> "
    action = $stdin.gets.chomp.downcase

    # Gothon needs to move / die
    if action == "shoot!"
      return 'death'
    elsif action == "dodge!"
      return 'death'
    elsif action == "tell a joke"
      puts "-" * 10
      return 'laser_weapon_armory'
    else
      puts "DOES NOT COMPUTE!"
      return 'central_corridor'
    end
  end
end

class LaserWeaponArmory < Scene

  def enter()
    puts "You're in the 'Laser Weapon Armory'"
    puts "There is a keypad in front of you,"
    puts "To enter you must gues the combination:"
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
      puts "Container opens....."
      puts "-" * 10
      return 'the_bridge'
    else
      puts "You've had too many attempts, "
      puts "The Gothon's have taken over!!"
      return 'death'
    end
  end
end

class TheBridge < Scene

  def enter()
    puts "You're on 'The Bridge'"
    puts "There is another Gothon there"
    puts "What do you do?"
    print "> "
    choice = $stdin.gets.chomp.downcase

    if choice == "place bomb"
      puts "You've placed the bomb"
      puts "-" * 10
      return 'escape_pod'
    elsif choice == "shoot!"
      return 'death'
    elsif choice == "blow us both to hell"
      return 'death'
    else
      puts "DOES NOT COMPUTE!"
      return 'the_bridge'
    end
  end
end

class EscapePod < Scene

  def enter()
    puts "You've got to the 'Escape Pod'"
    puts "There are multiple escape pods, "
    puts "and not all of them are working."
    puts "You must guess which one will get"
    puts "you home! 1-5?"
    print "[pod #]> "

    good_pod = rand(1..5)
    guess = $stdin.gets.chomp.to_i

    if guess != good_pod
      puts "Wrong pod"
      return 'death'
    else
      puts "Correct pod, you jump in and fly away to saftey!"
      puts "-" * 10
      return 'finished'
    end
  end
end


class Finished < Scene

  def enter()
    puts "Congratulations you've won!"
  end
end


class Map

  @@scenes = {
    'central_corridor' => CentralCorridor.new(),
    'laser_weapon_armory' => LaserWeaponArmory.new(),
    'the_bridge' => TheBridge.new(),
    'escape_pod' => EscapePod.new(),
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

a_map = Map.new('central_corridor')
a_game = Engine.new(a_map)
a_game.play()
