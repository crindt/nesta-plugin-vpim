# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nesta-plugin-vpim/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Craig Rindt"]
  gem.email         = ["crindt@gmail.com"]
  gem.description   = %q{A nesta plugin for processing vCard files}
  gem.summary       = %q{A nesta plugin for processing vCard files}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "nesta-plugin-vpim"
  gem.require_paths = ["lib"]
  gem.version       = Nesta::Plugin::Vpim::VERSION
  gem.add_dependency("nesta", ">= 0.9.11")
  gem.add_dependency("vcard", ">= 0.1.1")
  gem.add_development_dependency("rake")
end
