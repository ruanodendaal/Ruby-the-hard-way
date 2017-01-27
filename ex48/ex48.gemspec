# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "lexicon"
  spec.version       = '1.0'
  spec.authors       = ["Ruan Odendaal"]
  spec.email         = ["ruanodendaal@gmail.com"]
  spec.summary       = %q{Advanced user input, handling a wider lexicon.}
  spec.description   = %q{Longer description of your project.}
  spec.homepage      = "http://"
  spec.license       = "MIT"

  spec.files         = ['lib/ex48.rb']
  spec.executables   = ['bin/ex48']
  spec.test_files    = ['tests/test_lexicon.rb', 'tests/test_parser.rb']
  spec.require_paths = ["lib"]
end
