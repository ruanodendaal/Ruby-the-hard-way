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
      # checking for numbers before looking in dictionary
      if str =~ /\d/
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
