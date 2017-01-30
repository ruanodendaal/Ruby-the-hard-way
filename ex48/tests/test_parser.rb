require "ex48/parser.rb"
require "test/unit"

class TestParser < Test::Unit::TestCase

  def test_peek
    assert_equal(Parser.peek([['stop', 'the']]),
                              'stop')
    assert_equal(Parser.peek(nil), nil)
    result = Parser.peek([['stop', 'the'], ['noun', 'bear'], ['verb', 'eat']])
    assert_equal(result, 'stop')
  end

  def test_match
    assert_equal(Parser.match([['stop', 'the']], 'stop'),
                               ['stop', 'the'])
    assert_equal(Parser.match([['noun', 'bear']], 'noun'), ['noun', 'bear'])
    assert_equal(Parser.match([['noun', 'bear']], 'stop'), nil)
    assert_equal(Parser.match(nil, 'stop'), nil)

    result = Parser.match(Lexicon.scan("scream at the bear"), 'stop')
    assert_equal(result, nil)
    second_result = Parser.match(Lexicon.scan("at the bear"), 'stop')
    assert_equal(second_result, ['stop', 'at'])
  end

  def test_skip
    assert_equal(Parser.skip([['noun', 'scream']], 'stop'),
                              nil)
    assert_equal(Parser.skip([['stop', 'at']], 'stop'),
                              ['stop', 'at'])
    result = Parser.skip(Lexicon.scan("scream at the bear"), 'stop')
    assert_equal(result, nil)
  end

  def test_parse_verb
    assert_equal(Parser.parse_verb([['verb', 'run']]), ['verb', 'run'])
    assert_equal(Parser.parse_verb(Lexicon.scan("go north")), ['verb', 'go'])

    result = Parser.parse_verb(Lexicon.scan("eat the bear"))
    assert_equal(result, ['verb', 'eat'])

    assert_raise ParserError do
      Parser.parse_verb([['stop', 'the'], ['noun', 'bear']])
    end
  end

  def test_parse_object
    # noun test
    assert_equal(Parser.parse_object(Lexicon.scan("the bear run south")), ['noun', 'bear'])
    # direction test
    assert_equal(Parser.parse_object(Lexicon.scan("the south")), ['direction', 'south'])
    # error test
    assert_raise ParserError do
      Parser.parse_object(Lexicon.scan("run south"))
    end
  end

  def test_parse_subject
    # noun test
    assert_equal(Parser.parse_subject(Lexicon.scan("the bear run south")), ['noun', 'bear'])
    # verb test
    assert_equal(Parser.parse_subject(Lexicon.scan("run south")), ['noun', 'player'])
    # error test
    assert_raise ParserError do
      Parser.parse_subject(Lexicon.scan("south"))
    end
  end


  def test_parse_sentence
    result = Parser.parse_sentence(Lexicon.scan("the bear run south"))
    assert_equal(result.subject, "bear")
    assert_equal(result.verb, "run")
    assert_equal(result.object, "south")
  end

end
