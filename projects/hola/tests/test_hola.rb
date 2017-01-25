require "./lib/hola.rb"
require "test/unit"

class TestNAME < Test::Unit::TestCase

  def test_sample
    assert_equal(4, 2+2)
  end

  def test_any_hello
    assert_equal "hello world", Hola.hi("ruby")
  end

  def test_french_hello
    assert_equal "bonjour", Hola.hi("french")
  end
end
