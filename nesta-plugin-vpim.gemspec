# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nesta-plugin-vpim/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Craig Rindt"]
  gem.email         = ["crindt@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "nesta-plugin-vpim"
  gem.require_paths = ["lib"]
  gem.version       = Nesta::Plugin::Vpim::VERSION
  s.add_dependency("nesta", ">= 0.9.11")
  s.add_development_dependency("rake")
end