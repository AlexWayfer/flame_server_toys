# frozen_string_literal: true

require 'memery'
require 'yaml'

module FlameServerToys
	class Template
		## Base class for toys
		class Base
			include Toys::Template
			include Memery

			def initialize(config_proc:)
				@config_proc = config_proc
			end

			memoize def config
				@config_proc.call
			end

			## Common code for toys
			module CommonCode
				include Memery

				private

				def sh(command, print: true, exit_on_fail: true)
					options = {}
					options[:log_level] = Logger::UNKNOWN if print
					options[:exit_on_nonzero_status] = exit_on_fail
					super(sh_command(command), **options)
				end

				def sh_command(command)
					require 'shellwords'

					escaped_command = Shellwords.escape(command)
					"sh -c #{escaped_command}"
				end

				def server(command)
					puts "Environment: #{@config[:environment]}"

					sh "#{context_directory}/exe/setup/ruby.sh"
					sh("#{context_directory}/exe/setup/node.sh") if %i[start restart].include?(command)

					web_server(command)
				end

				def web_server(command)
					if @config[:environment] == 'development' && %i[start restart].include?(command)
						return development_restart
					end

					waiting_mailing_lock if %i[stop restart phased-restart].include?(command)
					puma_command command
				end

				def puma_command(command)
					## Don't use `bundle exec`: https://github.com/dazuma/toys/issues/65
					sh "pumactl #{command}"
				end

				def development_restart
					spawn_development_filewatchers

					puma_command File.exist?(@config[:server][:puma_pid_file]) ? 'restart' : 'start'
				end

				def spawn_development_filewatchers
					require 'filewatcher/matrix'

					Thread.new do
						matrix = Filewatcher::Matrix.new("#{context_directory}/filewatchers.yaml")
						matrix.start
					end
				end

				def waiting_mailing_lock
					while Dir[File.join(@config[:tmp_dir], 'mailing_*')].any?
						puts Paint['Mails sending in progress!', :bold, :red]
						puts 'Waiting...'
						sleep 1
					end
				end
			end
		end
	end
end
