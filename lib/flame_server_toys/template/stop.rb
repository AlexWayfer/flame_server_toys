# frozen_string_literal: true

module FlameServerToys
	class Template
		## Stop server
		class Stop < Base
			on_expand do |template|
				tool :stop do
					to_run do
						@config = template.config

						server :stop
					end
				end
			end
		end
	end
end
