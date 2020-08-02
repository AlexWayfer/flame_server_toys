# frozen_string_literal: true

module FlameServerToys
	class Template
		## Phased restart server
		class PhasedRestart < Base
			on_expand do |template|
				tool 'phased-restart' do
					to_run do
						@config = template.config

						server 'phased-restart'
					end
				end
			end
		end
	end
end
