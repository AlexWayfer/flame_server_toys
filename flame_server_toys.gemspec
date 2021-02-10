# frozen_string_literal: true

require_relative 'lib/flame_server_toys/version'

Gem::Specification.new do |spec|
	spec.name        = 'flame_server_toys'
	spec.version     = FlameServerToys::VERSION
	spec.authors     = ['Alexander Popov']
	spec.email       = ['alex.wayfer@gmail.com']

	spec.summary     = 'Toys for Flame web application server management'
	spec.description = <<~DESC
		Toys for Flame web application server management, like start, stop, restart, etc.
	DESC
	spec.license = 'MIT'

	source_code_uri = 'https://github.com/AlexWayfer/flame_server_toys'

	spec.homepage = source_code_uri

	spec.metadata['source_code_uri'] = source_code_uri

	spec.metadata['homepage_uri'] = spec.homepage

	spec.metadata['changelog_uri'] =
		'https://github.com/AlexWayfer/flame_server_toys/blob/master/CHANGELOG.md'

	spec.files = Dir['lib/**/*.rb', 'README.md', 'LICENSE.txt', 'CHANGELOG.md']

	spec.required_ruby_version = '>= 2.5', '< 4'

	spec.add_runtime_dependency 'alt_memery', '~> 2.0'
	spec.add_runtime_dependency 'filewatcher-matrix', '~> 0.1.0'
	spec.add_runtime_dependency 'gorilla_patch', '~> 4.0'
	spec.add_runtime_dependency 'toys-core', '~> 0.11.0'

	spec.add_development_dependency 'pry-byebug', '~> 3.9'

	spec.add_development_dependency 'bundler', '~> 2.0'
	spec.add_development_dependency 'gem_toys', '~> 0.5.0'
	spec.add_development_dependency 'toys', '~> 0.11.0'

	spec.add_development_dependency 'codecov', '~> 0.2.1'
	spec.add_development_dependency 'rspec', '~> 3.9'
	spec.add_development_dependency 'simplecov', '~> 0.20.0'

	spec.add_development_dependency 'rubocop', '~> 1.0'
	spec.add_development_dependency 'rubocop-performance', '~> 1.0'
	spec.add_development_dependency 'rubocop-rspec', '~> 2.0'
end
