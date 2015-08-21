$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tecla_cms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tecla_cms"
  s.version     = TeclaCms::VERSION
  s.authors     = ["Ankush Kataria"]
  s.email       = ["katariyaankush574@gmail.com"]
  s.homepage    = "http://www.example.com"
  s.summary     = "TeclaCms Engine."
  s.description = "Description of TeclaCms."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.3"
  s.add_dependency 'mongoid', "~> 5.0.0.beta"
  s.add_dependency 'devise'
  s.add_dependency 'carrierwave'
  s.add_dependency 'carrierwave-mongoid'
  s.add_dependency 'fog'
  s.add_dependency 'fog-aws'
  s.add_dependency 'bson_ext'
  s.add_dependency 'rolify'
  s.add_dependency 'cancancan', '~> 1.12.0'
  s.add_dependency 'mongoid-history'
  s.add_dependency 'mongoid_orderable'
  s.add_dependency 'grape'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'database_cleaner'
  s.test_files = Dir["spec/**/*"]
end
