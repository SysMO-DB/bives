# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bives/version'
require "bundler/gem_tasks"

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib/bives'
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

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

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end




