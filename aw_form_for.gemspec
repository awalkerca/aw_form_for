# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "aw_form_for/version"

Gem::Specification.new do |s|
  s.name        = "aw_form_for"
  s.version     = AWFormFor::VERSION
  s.authors     = ["Andrew Walker"]
  s.email       = ["contact@awalker.ca"]
  s.homepage    = ""
  s.summary     = %q{AW Form For: dry up some of my standard form logic into an external source.}
  s.description = %q{AW Form For provides a new form builder to simply the creation of forms. 
                    Fields automatically receive labels, checkbox lists can be created. Required fields
                    are automatically identified by attaching a class to the field wrapper.}

  s.rubyforge_project = "aw_form_for"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
