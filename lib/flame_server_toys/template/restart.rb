# frozen_string_literal: true

module FlameServerToys
	class Template
		## Restart server
		class Restart < Base
			on_expand do |template|
				tool :restart do
					to_run do
						@config = template.config

						server :restart
					end
				end
			end
		end
	end
end
