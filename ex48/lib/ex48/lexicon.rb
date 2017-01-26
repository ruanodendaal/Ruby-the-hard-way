# scanner that takes a string of raw input from
# the user and returns a sentence that's composed
# of an array of arrays with the (TOKEN, WORD)
# pairings. If a word isn't part of the lexicon
# then is should still return the WORD but set
# the TOKEN to an error token. #TODO
class Lexicon

@@dictionary = {
  'direction' => ['north', 'south', 'east'],
  'verb' => ['go', 'kill', 'eat'],
  'stop' => ['the', 'in', 'of'],
  'noun' => ['bear', 'princess'],
  'error' => []
}

  def self.scan(str)
    sentence = []
    str.split.each { |str|
      pairing = []
      if str =~ /\d/ #TODO - doesn't like numbers yet
        pairing = ['number', str.to_i]
        sentence.push(pairing)
      else
        @@dictionary.each { |token, word|
          if word.include?(str.downcase)
            pairing = [token, str.downcase]
            sentence.push(pairing)
            break
          elsif @@dictionary[token].empty?
            pairing = [token, str]
            sentence.push(pairing)
          end
        }
      end
    }
    sentence
  end
end
