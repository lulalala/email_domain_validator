# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'email_domain_validator/version'

Gem::Specification.new do |spec|
  spec.name          = "email_domain_validator"
  spec.version       = EmailDomainValidator::VERSION
  spec.authors       = ["lulalala"]
  spec.email         = ["mark@goodlife.tw"]
  spec.summary       = %q{Validates Email address domains using MX and A records, with caching and whitelisting.}
  spec.description   = %q{Validates Email address domains using MX and A records, with caching and whitelisting.}
  spec.homepage      = "https://github.com/lulalala/email_domain_validator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", '~> 3.1'
end
