# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "guard-grunt"
  spec.version       = File.open('VERSION') { |f| f.read }
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Georgeo Rocco"]
  spec.email         = ["ggrocco@gmail.com"]

  spec.summary       = %q{guard gem for grunt}
  spec.description   = %q{Guard::Grunt automatically starts/stops/restarts grunt}
  spec.homepage      = "http://rubygems.org/gems/guard-grunt"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }

  spec.require_paths = ["lib"]

  spec.add_dependency 'guard-compat', '~> 1.1'

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
