class Hola

  def self.hi(language = "english")
    translator = Translator.new(language)
    translator.hi
    #puts "Hello World!"
  end
end

require 'hola/translator.rb'
