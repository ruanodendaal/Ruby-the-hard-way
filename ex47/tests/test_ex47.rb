require "ex47/game.rb"
require "test/unit"

class TestGame < Test::Unit::TestCase

  def test_room()
    gold = Room.new("GoldRoom",
                    """This room has gold in it you can grab.
                    There's a door to the north.""")
    assert_equal("GoldRoom", gold.name)
    assert_equal({}, gold.paths)
  end

  def test_room_paths()
    center = Room.new("Center", "Test room in the center.")
    north = Room.new("North", "Test room in the north.")
    south = Room.new("South", "Test room in the south.")

    center.add_paths({'north'=> north, 'south'=> south})
    assert_equal(north, center.go('north'))
    assert_equal(south, center.go('south'))
  end

  def test_map()
    start = Room.new("Start", "You can go west and down a hole.")
    west = Room.new("Trees", "There are trees here, you can go east.")
    down = Room.new("Dungeon", "It's dark down here, you can go up.")

    start.add_paths({'west'=> west, 'down'=> down})
    west.add_paths({'east'=> start})
    down.add_paths({'up'=> start})

    assert_equal(west, start.go('west'))
    assert_equal(start, start.go('west').go('east'))
    assert_equal(start, start.go('down').go('up'))
  end

  def game_test()
    clearing = Room.new("ClearingScene", "You can go ForestTribe or WolfPack.")
    wolf_pack = Room.new("WolfPack", "You can go to the ForestTribe or Death.")
    forest_tribe = Room.new("ForestTribeScene", "You can go back to Clearing, continue to Volcano or Death.")
    volcano = Room.new("VolcanoScene", "You can go to the top VolcanoPortal or Death.")
    volcano_portal = Room.new("VolcanoPortal", "You can go to the Airport or Death.")
    airport = Room.new("AiportScene", "You can go back to Clearing or to AirportRunway.")
    airport_runway = Room.new("AirportRunway", "You can go to Death or Finish.")
    finished = Room.new("Finished", "You have won.")
    death = Room.new("Death", "Nowhere to go.")

    clearing.add_paths({'wolf_pack'=> wolf_pack, 'forest_tribe'=> forest_tribe, 'death'=> death})
    wolf_pack.add_paths({'death'=> death, 'forest_tribe'=> forest_tribe})
    forest_tribe.add_paths({'clearing'=> clearing, 'volcano'=> volcano, 'death'=> death})
    volcano.add_paths({'volcano_portal'=> volcano_portal, 'death'=> death})
    volcano_portal.add_paths({'airport'=> airport, 'death'=> death})
    airport.add_paths({'clearing'=> clearing, 'airport_runway'=> airport_runway, 'death'=> death})
    airport_runway.add_paths({'finished'=> finished, 'death'=> death})

    assert_equal(death, clearing.go('forest_tribe').go('volcano').go('volcano_portal').go('airport').go('airport_runway').go('finished'))
    assert_equal(death, clearing.go('wolf_pack').go('forest_tribe').go('death'))
    assert_equal(death, forest_tribe.go('clearing'))
    assert_equal(death, airport.go('clearing'))
    assert_equal(death, volcano.go('death'))
    assert_equal(death, volcano_portal.go('death'))
    assert_equal(death, airport.go('death'))
    assert_equal(death, airport_runway.go('death'))
  end
end
