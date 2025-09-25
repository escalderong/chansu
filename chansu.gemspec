# frozen_string_literal: true

require_relative 'lib/chansu/version'

Gem::Specification.new do |spec|
  spec.name = 'chansu'
  spec.version = Chansu::VERSION
  spec.authors = ['Santiago Calderon']
  spec.email = ['escalderongv@gmail.com']

  spec.summary = 'A Ruby DSL for probabilities, randomness, and dice.'
  spec.description = '
    Chansu is a Ruby DSL for working with randomness and probability.
    It provides helpers like `chance("35%")`, `dice(6, 3)`, and RPG-style
    aliases such as `d20` and `d100`. It also includes higher-level
    constructs like `often { ... }`, `rarely { ... }`, and `until_success`
    for expressive probabilistic logic. Useful for games, simulations,
    and playful Ruby experiments.'
  spec.homepage = 'https://github.com/escalderong/chansu'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.2.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/escalderong/chansu'
  spec.metadata['changelog_uri'] = 'https://github.com/escalderong/chansu/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
