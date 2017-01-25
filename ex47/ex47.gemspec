# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "Game"
  spec.version       = '1.0'
  spec.authors       = ["Ruan Odendaal"]
  spec.email         = ["ruanodendaal@gmail.com"]
  spec.summary       = %q{Short summary of your project.}
  spec.description   = %q{Longer description of your project.}
  spec.homepage      = "http://"
  spec.license       = "MIT"

  spec.files         = ['lib/ex47.rb']
  spec.test_files    = ['tests/test_ex47.rb']
  spec.require_paths = ["lib"]
end
