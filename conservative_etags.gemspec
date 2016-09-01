$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "conservative_etags/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "conservative_etags"
  s.version     = ConservativeEtags::VERSION
  s.authors     = ["Tyler Gannon"]
  s.email       = ["tyler@aprilseven.co"]
  s.homepage    = "http://github.com/tylergannon/conservative_etags"
  s.summary     = "A Gem for helping to manage page staleness, compatible with Turbolinks 5."
  s.description = "A Gem for helping to manage page staleness, compatible with Turbolinks 5."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0"

  s.add_development_dependency "sqlite3"
end
