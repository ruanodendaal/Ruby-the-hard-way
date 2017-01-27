require "ex48/parser.rb"
require "test/unit"

class TestParser < Test::Unit::TestCase

  def test_peek
    assert_equal(Parser.peek([['stop', 'the'],
                              ['noun', 'bear']]),
                              'stop')
    assert_equal(Parser.peek(nil), nil)
  end

  def test_match
    assert_equal(Parser.match([['stop', 'the'],
                               ['noun', 'bear']], 'stop'),
                               ['stop', 'the'])
    assert_equal(Parser.match([['noun', 'bear']], 'stop'), nil)
    assert_equal(Parser.match(nil, 'stop'), nil)
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
