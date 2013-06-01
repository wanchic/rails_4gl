# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_4gl/version'

Gem::Specification.new do |gem|
  gem.name          = "rails_4gl"
  gem.version       = Rails4gl::VERSION
  gem.authors       = ["Eric Wanchic"]
  gem.email         = ["eric@wanchic.com"]
  gem.description   = %q{Implement rails 4th generational language programming}
  gem.summary       = %q{Implement rails 4th generational language programming}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"
end
