# -*- encoding: utf-8 -*-
require File.expand_path('../lib/free_text/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["cgorrieri"]
  gem.email         = ["cyril.gorrieri@gmail.com"]
  gem.summary       = "A WYSIWYG editor with save."
  gem.description   = "Insert FreeText description."
  gem.homepage      = "https://github.com/cgorrieri/free-text"

  gem.files         = Dir["{lib,vendor}/**/*"] + ["LICENSE", "README.md"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "free_text"
  gem.require_paths = ["lib"]
  gem.version       = FreeText::VERSION
end
