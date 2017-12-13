
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "manhattan_bar_directory/version"

Gem::Specification.new do |spec|
  spec.name          = "manhattan_bar_directory"
  spec.version       = ManhattanBarDirectory::VERSION
  spec.authors       = ["'Rachel Miller'"]
  spec.email         = ["'raeanne1991@gmail.com'"]

  spec.summary       = "Best Bars in Manhattan, NY"
  spec.description   = "Provides details on some of the best bars in Manhattan, NY."
  spec.homepage      = "https://github.com/raemillz/manhattan-bar-directory-cli-gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "lib/manhattan_bar_directory"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"

end
