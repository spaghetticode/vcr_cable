$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "vcr_cable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "vcr_cable"
  s.version     = VcrCable::VERSION
  s.authors     = ["andrea longhi"]
  s.email       = ["andrea@spaghetticode.it"]
  s.homepage    = "https://github.com/spaghetticode/vcr_cable"
  s.summary     = "use VCR in development"
  s.description = "use VCR in development (or whatever Rails environment you want)"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails'
  s.add_dependency 'vcr'

  s.add_development_dependency 'fakeweb'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'guard-test'
  s.add_development_dependency 'mocha'
end
