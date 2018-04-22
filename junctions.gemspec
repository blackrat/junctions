$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'junctions'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'junctions'
  s.version     = Rails::Junctions::VERSION
  s.authors     = ['Paul McKibbin']
  s.email       = ['pmckibbin@gmail.com']
  s.homepage    = 'http://blackrat.org'
  s.summary     = 'Summary of Junctions.'
  s.description = 'Description of Junctions.'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_dependency 'activesupport'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'config_files'
end
