#!/usr/bin/env gem build
# encoding: utf-8

require File.expand_path('../lib/sinatra-decorator/version', __FILE__)

Gem::Specification.new do |s|
  s.name          = "sinatra-decorator"
  s.rubyforge_project = "sinatra-decorator"
  s.authors       = ["Naotoshi Seo"]
  s.email         = ["sonots@gmail.com"]
  s.summary       = "View models for sinatra"
  s.homepage      = "https://github.com/sonots/sinatra-decorator#readme"
  s.description   = "Object-Oriented layer of presentation logic to your Sinatra apps."
  s.required_rubygems_version = ">= 1.3.6"
  s.version       = Sinatra::Decorator.version
  s.date          = Time.now.strftime("%Y-%m-%d")

  s.extra_rdoc_files = Dir["*.rdoc"]
  s.files         = `git ls-files`.split($\)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.rdoc_options  = ["--charset=UTF-8"]
  
  s.add_runtime_dependency "activesupport"
end
