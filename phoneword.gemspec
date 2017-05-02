# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'phoneword/version'

Gem::Specification.new do |spec|
  spec.name          = "phoneword"
  spec.version       = Phoneword::VERSION
  spec.authors       = ["Dmytro V."]
  spec.email         = ["staff1489@gmail.com"]

  spec.summary       = %q{Convert phone number to 1-800-PHONEWORD format.}
  spec.description   = %q{Selects words from the dictionary which are equivalents to a given telepnone number.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "minitest", "~> 5.10"
end
