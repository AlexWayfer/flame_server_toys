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

	github_uri = "https://github.com/AlexWayfer/#{spec.name}"

	spec.homepage = github_uri

	spec.metadata = {
		'bug_tracker_uri' => "#{github_uri}/issues",
		'changelog_uri' => "#{github_uri}/blob/v#{spec.version}/CHANGELOG.md",
		'documentation_uri' => "http://www.rubydoc.info/gems/#{spec.name}/#{spec.version}",
		'homepage_uri' => spec.homepage,
		'rubygems_mfa_required' => 'true',
		'source_code_uri' => github_uri,
		'wiki_uri' => "#{github_uri}/wiki"
	}

	spec.files = Dir['lib/**/*.rb', 'README.md', 'LICENSE.txt', 'CHANGELOG.md']

	spec.required_ruby_version = '>= 3.0', '< 4'

	spec.add_runtime_dependency 'alt_memery', '~> 2.0'
	spec.add_runtime_dependency 'filewatcher-matrix', '~> 1.0.0'
	spec.add_runtime_dependency 'gorilla_patch', '>= 4.0', '< 6'
	spec.add_runtime_dependency 'toys-core', '~> 0.15.3'
end
