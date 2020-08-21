# frozen_string_literal: true

module FlameServerToys
	class Template
		## Phased restart server
		class PhasedRestart < Base
			on_expand do |template|
				tool 'phased-restart' do
					to_run do
						@config = template.config

						puma_config = File.read "#{context_directory}/config/puma.rb"
						unless puma_config.lines.any? { |line| line.start_with? 'prune_bundler' }
							puts "Don't do phased restart without `prune_bundler` in Puma config."
							return
						end

						server 'phased-restart'
					end
				end
			end
		end
	end
end
