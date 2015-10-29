# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'likeable/version'

Gem::Specification.new do |spec|
  spec.name          = 'likeable'
  spec.version       = Likeable::VERSION
  spec.authors       = ['Vincent Garrigues']
  spec.email         = ['vincent.garrigues@gmail.com']
  spec.summary       = %q{Create a SoundCloud playlist based on your followings likes.}
  spec.homepage      = 'http://garriguv.io'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'thor', '~> 0.19.1'
  spec.add_runtime_dependency 'faraday', '~> 0.9.0'
  spec.add_runtime_dependency 'faraday_middleware', '~> 0.9.1'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.3.0'
  spec.add_development_dependency 'guard-rspec', '~> 4.6.4'
  spec.add_development_dependency 'factory_girl', '~> 4.5.0'
end
