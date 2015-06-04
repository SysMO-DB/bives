# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require 'bives/version'


Gem::Specification.new do |spec|
  spec.name          = "bives"
  spec.version       = Bives::VERSION
  spec.authors       = ["Stuart Owen"]
  spec.email         = ["stuart.owen@manchester.ac.uk"]
  spec.description   = %q{Ruby wrapper for the BiVeS model version comparison tool}
  spec.summary       = %q{Ruby wrapper to interface with the BiVeS model version comparison tool - http://sems.uni-rostock.de/projects/bives/}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
  spec.add_development_dependency "test-unit", "~> 3.0"

  spec.add_runtime_dependency "open4","~>1.3.0"

end




