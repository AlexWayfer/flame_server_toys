# frozen_string_literal: true

require 'memery'
require 'yaml'

require_relative '_pids_file'

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

				def sh(command, print: true)
					options = { log_level: Logger::UNKNOWN } if print
					super sh_command(command), **options
				end

				def sh_spawn(command, print: true)
					puts "spawn #{command}" if print
					spawn sh_command(command), pgroup: true
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

					if %i[stop restart].include?(command)
						filewatcher_pids_file = pids_file_class.new(:filewatcher)
						filewatcher_pids_file.kill_each.delete
					end

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
				rescue SystemExit, Interrupt => e
					pids_file_class.new(:filewatcher).kill_each.delete

					raise e
				end

				def spawn_development_filewatchers
					development_filewatchers =
						YAML.load_file("#{context_directory}/filewatchers.yaml").map do |args|
							filewatcher_command args[:pattern], args[:command], exclude: args[:exclude]
						end

					filewatcher_pids = development_filewatchers.map { |command| sh_spawn command }

					pids_file_class.new(:filewatcher, filewatcher_pids).dump
				end

				def filewatcher_command(pattern, execute, exclude: nil)
					## Don't use `bundle exec`, it's already required by `toys`
					## https://github.com/dazuma/toys/issues/65
					<<-CMD.split.join(' ')
						filewatcher #{"--exclude '#{exclude}'" unless exclude.nil?} '#{pattern}' '#{execute}'
					CMD
				end

				def waiting_mailing_lock
					while Dir[File.join(@config[:tmp_dir], 'mailing_*')].any?
						puts Paint['Mails sending in progress!', :bold, :red]
						puts 'Waiting...'
						sleep 1
					end
				end

				memoize def pids_file_class
					subclass = Class.new(PidsFile)
					pids_dir = @config[:pids_dir]
					subclass.class_exec do
						self.pids_dir = pids_dir
					end
					subclass
				end
			end
		end
	end
end
