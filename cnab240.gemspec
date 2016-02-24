# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cnab240/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'bindata', '~> 2.2.0'

  gem.authors       = ['Eduardo Mourao (RIP)', 'Kivanio Barbosa']
  gem.email         = ['kivanio@gmail.com']
  gem.description   = 'Formato CNAB 240.'
  gem.summary       = 'Formato CNAB 240.'
  gem.homepage      = 'https://github.com/eduardordm/cnab240'

  gem.rubyforge_project = 'cnab240'

  gem.files         = Dir.glob('lib/**/*') + ['Rakefile'] + ['cnab240.gemspec']
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'cnab240'
  gem.require_paths = ['lib']
  gem.version       = Cnab240::VERSION
end
