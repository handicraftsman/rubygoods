# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubygoods/version'

Gem::Specification.new do |spec|
  spec.name          = "rubygoods"
  spec.version       = RG::VERSION
  spec.authors       = ["Nickolay Ilyushin"]
  spec.email         = ["nickolay02@inbox.ru"]

  spec.summary       = %q{NYI. In future this would include some functions i am writing in each ruby program.}
  spec.description   = %q{Currently added: simple logs. Gonna make it write logfiles.}
  spec.homepage      = "https://127.0.0.1"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "rainbow", "~> 2.1"
end
