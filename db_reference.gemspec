# -*- encoding: utf-8 -*-
require File.expand_path('../lib/db_reference/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Cameron Fowler"]
  gem.email         = ["cameron.fowler@abletech.co.nz"]
  gem.description   = %q{Used to create a predefined set of model instances}
  gem.summary       = %q{Loads files from db/reference/*.rb}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "db_reference"
  gem.require_paths = ["lib"]
  gem.version       = DbReference::VERSION

  gem.add_runtime_dependency 'rake'
  gem.add_runtime_dependency 'rails', '~> 3.0'
end
