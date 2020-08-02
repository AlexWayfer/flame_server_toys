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

						pids_file_class.new(:filewatcher).kill_each.delete
					end
				end
			end
		end
	end
end
