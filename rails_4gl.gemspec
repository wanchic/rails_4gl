# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_4gl/version'

Gem::Specification.new do |s|
  s.name          = "rails_4gl"
  s.version       = Rails4gl::VERSION
  s.authors       = ["Eric Wanchic"]
  s.email         = ["eric@wanchic.com"]
  s.summary       = %q{Rails 4th generational language programming}
  s.description   = %q{Implement rails 4th generational language programming through the use of scaffolds, suggested best coding practices, and the use of mapped design patterns}
  s.homepage      = ""

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_development_dependency 'rspec-rails', '~> 2.0.1'
  s.add_development_dependency 'rails', '~> 3.2.0'

  s.rubyforge_project = s.name
end
