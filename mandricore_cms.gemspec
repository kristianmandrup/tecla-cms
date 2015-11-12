$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'cms/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'mandricore_cms'
  s.version     = Cms::VERSION
  s.authors     = [
    'Ankush Kataria',
    'Kristian Mandrup'
  ]
  s.email       = [
    'kmandrup@gmail.com',
    'katariyaankush574@gmail.com'
  ]
  s.homepage    = 'http://www.mandricore.com'
  s.summary     = 'Mandricore Cms Engine.'
  s.description = 'Engine for Mandricore Cms'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '~> 4.2.3'
  s.add_dependency 'mongoid', '~> 5.0.0.beta'
  s.add_dependency 'bson_ext'
  s.add_dependency 'devise'
  s.add_dependency 'rolify'
  s.add_dependency 'cancancan', '~> 1.12.0'
  s.add_dependency 'grape'
  s.add_dependency 'jwt'
  s.add_dependency 'liquid', '~> 3.0.6'
  s.add_dependency 'render_anywhere', '~> 0.0.12'
  s.add_dependency 'concerned'
  s.add_dependency 'cms-models'
  s.add_dependency 'carrierwave_backgrounder'
  s.add_dependency 'json_token_authentication', '~> 0.1.0'

  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'database_cleaner'
  s.test_files = Dir['spec/**/*']
end
