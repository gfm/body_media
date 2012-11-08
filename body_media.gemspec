# -*- encoding: utf-8 -*-
require File.expand_path('../lib/body_media/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tim Payne"]
  gem.email         = ["tim@fitorbit.com"]
  gem.description   = %q{Body Media API wrapper}
  gem.summary       = %q{Body Media API wrapper}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "body_media"
  gem.require_paths = ["lib"]
  gem.version       = BodyMedia::VERSION

  gem.add_runtime_dependency 'oauth', '~> 0.4'
  gem.add_runtime_dependency 'multi_json', '~> 1.3'
end
