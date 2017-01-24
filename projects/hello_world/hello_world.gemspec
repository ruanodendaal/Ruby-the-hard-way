# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "hello_world"
  spec.version       = '1.0'
  spec.authors       = ["Ruan Odendaal"]
  spec.email         = ["ruanodendaal@gmail.com"]
  spec.summary       = %q{Simple 'Hello World' test program.}
  spec.description   = %q{Longer description of your project.}
  spec.homepage      = "http://domainofproject.com/"
  spec.license       = "MIT"

  spec.files         = ['lib/hello_world.rb']
  spec.executables   = ['bin/hello_world']
  spec.test_files    = ['tests/test_hello_world.rb']
  spec.require_paths = ["lib"]
end
