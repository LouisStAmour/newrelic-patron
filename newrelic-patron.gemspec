$LOAD_PATH.unshift 'lib'
require "newrelic_patron/version"

Gem::Specification.new do |s|
  s.name = "newrelic_patron"
  s.version = NewrelicPatron::VERSION::STRING

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Evgeny Dudin"]
  s.description = "Patron instrumentation for Newrelic."
  s.email = ["nagliyvred@gmail.com"]
  s.has_rdoc = false
  s.files = %w( README.md LICENSE newrelic-patron.gemspec )
  s.files += Dir.glob("lib/**/*")
  s.homepage = "http://github.com/nagliyvred/newrelic-patron"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.5.3"
  s.summary = "Patron instrumentation for Newrelic."
  s.license = "MIT"

  s.add_dependency(%q<patron>, ["~> 0"])
  s.add_dependency(%q<newrelic_rpm>, ["> 3.0"])
end
