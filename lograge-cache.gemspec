# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lograge/cache/version'

Gem::Specification.new do |spec|
  spec.name          = 'lograge-cache'
  spec.version       = Lograge::Cache::VERSION
  spec.authors       = ['James Tan']
  spec.email         = ['james_tan97@outlook.com']

  spec.summary       = 'An extension for Lograge to log Cache queries'
  spec.description   = 'An extension for Lograge to log Cache queries'
  spec.homepage      = 'https://github.com/jamestjw/lograge-cache'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activerecord', '>= 4', '< 7.0'
  spec.add_runtime_dependency 'lograge', '~> 0.4'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
end
