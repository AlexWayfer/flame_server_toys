# Flame Server Toys

[![Cirrus CI - Base Branch Build Status](https://img.shields.io/cirrus/github/AlexWayfer/flame_server_toys?style=flat-square)](https://cirrus-ci.com/github/AlexWayfer/flame_server_toys)
[![Codecov branch](https://img.shields.io/codecov/c/github/AlexWayfer/flame_server_toys/master.svg?style=flat-square)](https://codecov.io/gh/AlexWayfer/flame_server_toys)
[![Code Climate](https://img.shields.io/codeclimate/maintainability/AlexWayfer/flame_server_toys.svg?style=flat-square)](https://codeclimate.com/github/AlexWayfer/flame_server_toys)
[![Depfu](https://img.shields.io/depfu/AlexWayfer/flame_server_toys?style=flat-square)](https://depfu.com/repos/github/AlexWayfer/flame_server_toys)
[![Inline docs](https://inch-ci.org/github/AlexWayfer/flame_server_toys.svg?branch=master)](https://inch-ci.org/github/AlexWayfer/flame_server_toys)
[![License](https://img.shields.io/github/license/AlexWayfer/flame_server_toys.svg?style=flat-square)](https://github.com/AlexWayfer/flame_server_toys/blob/master/LICENSE.txt)
[![Gem](https://img.shields.io/gem/v/flame_server_toys.svg?style=flat-square)](https://rubygems.org/gems/flame_server_toys)

Toys for [Flame](https://github.com/AlexWayfer/flame) web application server management,
like start, stop, restart, etc.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'flame_server_toys'
```

And then execute:

```shell
bundle install
```

Or install it yourself as:

```shell
gem install flame_server_toys
```

## Usage

```ruby
## .toys/.toys.rb
require "#{__dir__}/../config/base"

require 'flame_server_toys'
expand FlameServerToys::Template,
  config_proc: (proc do
    MyProject::Config::Base.new
  end)
```

On `start` and `restart` commands in `development` environment there will be spawned
[Filewatchers](https://github.com/filewatcher/filewatcher) from `filewatcher.yaml` file.

## Development

After checking out the repo, run `bundle install` to install dependencies.

Then, run `toys rspec` to run the tests.

To install this gem onto your local machine, run `toys gem install`.

To release a new version, run `toys gem release %version%`.
See how it works [here](https://github.com/AlexWayfer/gem_toys#release).

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/AlexWayfer/flame_server_toys).

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).
