class Hola

  def self.hi(language = "english")
    translator = Translator.new(language)
    translator.hi
    #puts "Hello World!"
  end
end


class Hola::Translator

  def initialize(language)
    @language = language
  end

  def hi
    case @language
    when "afrikaans"
      "hallo"
    when "spanish"
      "hola mundo"
    when "french"
      "bonjour"
    when "german"
      "hallo"
    else
      "hello world"
    end
  end
end
