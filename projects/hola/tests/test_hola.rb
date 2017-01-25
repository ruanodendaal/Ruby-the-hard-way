require "./lib/hola.rb"
require "test/unit"

class TestHola < Test::Unit::TestCase

  def test_any_hello
    assert_equal "hello world", Hola.hi("ruby")
  end

  def test_french_hello
    assert_equal "bonjour", Hola.hi("french")
  end
end
