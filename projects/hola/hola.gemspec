# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "hola"
  spec.version       = '1.0'
  spec.authors       = ["Ruan Odendaal"]
  spec.email         = ["ruanodendaal@gmail.com"]
  spec.summary       = %q{Simple 'Hello World' test program.}
  spec.description   = %q{Longer description of your project.}
  spec.homepage      = "http://"
  spec.license       = "MIT"

  spec.files         = ['lib/hola.rb']
  spec.executables   = ['greeter']
  spec.test_files    = ['tests/test_hola.rb']
  spec.require_paths = ['lib']
end
