# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "hola"
  spec.version       = '1.1'
  spec.authors       = ["Ruan Odendaal"]
  spec.email         = ["ruanodendaal@gmail.com"]
  spec.summary       = %q{Simple 'Hello World' program.}
  spec.description   = %q{Hello world program that includes a translator when passed a language plus an executable.}
  spec.homepage      = "http://"
  spec.license       = "MIT"

  spec.files         = ['lib/hola.rb', 'lib/hola/translator.rb']
  spec.executables   = ['greeter']
  spec.test_files    = ['tests/test_hola.rb']
  spec.require_paths = ['lib']
end
