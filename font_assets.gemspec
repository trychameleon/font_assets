# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'font_assets/version'

Gem::Specification.new do |s|
  s.name        = 'font_assets'
  s.version     = FontAssets::VERSION
  s.authors     = ['Eric Allam', 'Brian Norton']
  s.email       = ['rubymaverick@gmail.com', 'brian.nort@gmail.com']
  s.homepage    = 'https://github.com/trychameleon/font_assets'
  s.summary     = %q{Improve font serving in Rails 3.1}
  s.description = %q{Improve font serving in Rails 3.1}

  s.rubyforge_project = 'font_assets'

  s.files         = `git ls-files`.split('\n')
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split('\n')
  s.executables   = `git ls-files -- bin/*`.split('\n').map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'rack'
  s.add_development_dependency 'rspec', '~> 3.2'
  s.add_development_dependency 'rspec-its'
end
