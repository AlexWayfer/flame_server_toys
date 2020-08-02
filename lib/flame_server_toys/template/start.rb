# frozen_string_literal: true

module FlameServerToys
	class Template
		## Start server
		class Start < Base
			on_expand do |template|
				tool :start do
					to_run do
						@config = template.config

						server :start
					end
				end
			end
		end
	end
end
