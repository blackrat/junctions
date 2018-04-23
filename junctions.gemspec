$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'junctions'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'junctions'
  s.version     = Rails::Junctions::VERSION
  s.authors     = ['Paul McKibbin']
  s.email       = ['pmckibbin@gmail.com']
  s.homepage    = 'http://github.com/blackrat/junctions'
  s.summary     = 'Summary of Junctions.'
  s.description = 'Description of Junctions.'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_dependency 'activesupport', '~> 3.0.17'

  s.add_development_dependency 'bundler', '~> 0'
  s.add_development_dependency 'rake', '~> 0'
  s.add_development_dependency 'minitest', '~> 0'
  s.add_development_dependency 'simplecov', '~> 0'
  s.add_development_dependency 'config_files', '~> 0'
end
