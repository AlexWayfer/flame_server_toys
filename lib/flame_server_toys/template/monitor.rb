# frozen_string_literal: true

module FlameServerToys
	class Template
		## Monitor server logs
		class Monitor < Base
			on_expand do |template|
				tool :monitor do
					to_run do
						@config = template.config

						sh "tail -f #{File.join(@config[:logs_dir], '{stdout,stderr}')}"
					end
				end
			end
		end
	end
end
