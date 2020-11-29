require_relative 'lib/thread_ripper/version'

Gem::Specification.new do |spec|
  spec.name          = "thread_ripper"
  spec.version       = ThreadRipper::VERSION
  spec.authors       = ["zogoo"]
  spec.email         = ["chtsogbadrakh@gmail.com"]

  spec.summary       = "Thread spawn with C extension"
  spec.description   = "C extension code will create new thread and print Hello world"
  spec.homepage      = "http://github.com/Zogoo/thread_ripper"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://github.com/Zogoo/thread_ripper"
  spec.metadata["changelog_uri"] = "http://github.com/Zogoo/thread_ripper/README.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.extensions = %w[ext/thread_ripper/extconf.rb]
end
