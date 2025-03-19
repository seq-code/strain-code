$:.unshift File.join(File.dirname(__FILE__), 'lib')

require 'strain-code/version'

Gem::Specification.new do |s|
  s.name        = 'strain-code'
  s.version     = StrainCode::VERSION
  s.summary     = 'Parsing and formatting of strain numbers'
  s.description = 'Strain numbers are microbiological culture collection identifiers'

  s.files = Dir[
    'lib/**/*.rb', 'data/*', 'test/**/*.rb', 'bin/*',
    'Gemfile', 'Rakefile', 'README.md', 'LICENSE'
  ]

  # Docs + tests
  s.extra_rdoc_files << 'README.md'
  s.rdoc_options = %w(lib README.md --main README.md)
  s.rdoc_options << '--title' << s.summary
  s.add_development_dependency 'rake'
  s.add_development_dependency 'test-unit'

  # Metadata
  s.authors  = ['Luis M. Rodriguez-R']
  s.email    = 'lmrodriguezr@gmail.com'
  s.homepage = 'https://github.com/seq-code/strain-code'
end
