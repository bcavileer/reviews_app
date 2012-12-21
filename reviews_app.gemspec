# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reviews_app/version'

Gem::Specification.new do |gem|
  gem.name          = "reviews_app"
  gem.version       = ReviewsApp::VERSION
  gem.authors       = ["benjamin"]
  gem.email         = ["bcavileer@gmail.com"]
  gem.description   = "Reviews Application"
  gem.summary       = "Reviews Application"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'turnip'
  gem.add_development_dependency 'factory_girl'
  gem.add_development_dependency 'guard-rspec'
end
