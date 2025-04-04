require_relative 'lib/school/version'

Gem::Specification.new do |spec|
  spec.name        = 'school'
  spec.version     = School::VERSION
  spec.authors     = ['Rodrigo Campos']
  spec.email       = ['ricamphe@gmail.com']
  spec.homepage    = 'https://andes.academy/school'
  spec.summary     = 'Andes Academy School.'
  spec.description = 'Andes Academy School.'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/chaskas/andes'
  spec.metadata['changelog_uri'] = 'https://github.com/chaskas/andes/blob/main/engines/school/CHANGELOG.md'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'cssbundling-rails', '~> 1.4'
  spec.add_dependency 'importmap-rails'
  spec.add_dependency 'pg'
  spec.add_dependency 'rails', '>= 7.1.3.2'
  # spec.add_dependency 'dotenv'
  spec.add_development_dependency "dotenv-rails", "~> 2.8" 
  spec.add_dependency 'launchdarkly-server-sdk', '8.8.2'

end
