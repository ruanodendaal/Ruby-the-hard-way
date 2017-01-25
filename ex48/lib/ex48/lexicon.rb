# scanner that takes a string of raw input from
# the user and returns a sentence that's composed
# of an array of arrays with the (TOKEN, WORD)
# pairings. If a word isn't part of the lexicon
# then is should still return the WORD but set
# the TOKEN to an error token.
class Lexicon

@@dictionary = {
  'direction' => ['north', 'south', 'east'],
  'verb' => ['go', 'kill', 'eat']
}

  def self.scan(str)
    sentence = []
    str.split.each { |str|
      pairing = []
      @@dictionary.each { |token, word|
        if word.include?(str.downcase)
          pairing = [token, str]
          sentence.push(pairing)
        end
      }
    }

    sentence

  end
end
