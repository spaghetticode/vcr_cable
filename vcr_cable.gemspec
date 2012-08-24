$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "vcr_cable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "vcr_cable"
  s.version     = VcrCable::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of VcrCable."
  s.description = "TODO: Description of VcrCable."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", '~> 3.2.0'
  s.add_dependency 'vcr', '~> 2.0.0'

  s.add_development_dependency 'fakeweb'
  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'guard-test'
  s.add_development_dependency 'mocha'
end
