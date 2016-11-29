# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'drebedengi/rb/version'

Gem::Specification.new do |spec|
  spec.name          = "drebedengi-rb"
  spec.version       = Drebedengi::Rb::VERSION
  spec.authors       = ["Sergio Tulentsev"]
  spec.email         = ["sergei.tulentsev@gmail.com"]

  spec.summary       = %q{Client library for http://www.drebedengi.ru}
  spec.description   = %q{Drebedengi is a finance-tracking application. Unfortunately, their API is SOAP-based. This gem shields you from the horrors of SOAP and aims to give you the ruby experience.}
  spec.homepage      = ""

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency 'savon', '~> 2.11'
end
