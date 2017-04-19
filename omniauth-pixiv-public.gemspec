# encoding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth-pixiv/version"

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-pixiv-public'
  spec.version       = Omniauth::Pixiv::VERSION
  spec.authors       = ['Edho Arief', 'alpaca-tc']
  spec.email         = ['nanaya@pixiv.com', 'alpaca-tc@alpaca.tc']
  spec.description   = 'OmniAuth strategy for pixiv.'
  spec.summary       = 'OmniAuth strategy for pixiv.'
  spec.homepage      = 'https://github.com/pixiv/omniauth-pixiv-public'
  spec.license       = 'AGPL-3.0'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.3.0'

  spec.add_dependency 'omniauth-oauth2', '>= 1.0'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
