$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "zoo/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "zoo"
  s.version     = Zoo::VERSION
  s.authors     = ["nguyentt2"]
  s.email       = ["nguyentt2@topica.edu.vn"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Zoo."
  s.description = "TODO: Description of Zoo."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"

  s.add_development_dependency "sqlite3"
end
