require "ex48/parser.rb"
require "test/unit"

class TestParser < Test::Unit::TestCase

  def test_peek
    assert_equal(Parser.peek([['stop', 'the'],
                       ['noun', 'bear']]),
                       'stop')
  end

  def test_match
  end

  def test_skip
  end

  def test_parse_verb
  end

  def test_parse_object
  end

  def test_parse_subject
  end


  def test_parse_sentence
    #assert_equal(parse_sentence(("the bear run south"), [['stop', 'the]'], ['subject', 'bear'], ['verb', 'run'], ['direction', 'south']]))
    #result = Sentence.parse_sentence("north SOUTH east")
    #assert_equal(result, [['direction', 'north'],
    #                      ['direction', 'south'],
    #                      ['direction', 'east']])
  end

end
