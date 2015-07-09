$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pagination_responder/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pagination_responder"
  s.version     = PaginationResponder::VERSION
  s.authors     = ["zwelchcb"]
  s.email       = ["Zachary.Welch@careerbuilder.com"]
  s.homepage    = "https://cagit.careerbuilder.com/zwelch/pagination_responder"
  s.summary     = "Pagination Responder for responders gem."
  s.description = "Pagination Responder for responders gem."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency "responders"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "kaminari"
end
