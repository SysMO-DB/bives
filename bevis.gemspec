# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bevis/version'

Gem::Specification.new do |spec|
  spec.name          = "bevis"
  spec.version       = Bevis::VERSION
  spec.authors       = ["Stuart Owen"]
  spec.email         = ["stuart.owen@manchester.ac.uk"]
  spec.description   = %q{Ruby wrapper for the BIVES model version comparison tool}
  spec.summary       = %q{Ruby wrapper to interface with the BEVIS model version comparison tool - http://sems.uni-rostock.de/projects/bives/}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
