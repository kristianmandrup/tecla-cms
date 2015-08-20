$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tecla_cms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tecla_cms"
  s.version     = TeclaCms::VERSION
  s.authors     = [""]
  s.email       = [""]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of TeclaCms."
  s.description = "TODO: Description of TeclaCms."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.3"
  s.add_dependency 'mongoid'
  
  s.test_files = Dir["spec/**/*"]
end
