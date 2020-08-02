# frozen_string_literal: true

module FlameServerToys
	class Template
		## Status of server
		class Status < Base
			on_expand do |template|
				tool :status do
					to_run do
						@config = template.config

						puts
						puts 'Filewatcher:'
						puts
						ps_with_grep '[f]ilewatcher'
						puts
						puts 'Puma:'
						puts
						ps_with_grep '[p]uma[\ :]'
					end

					private

					def ps_with_grep(pattern)
						sh "ps aux | grep #{pattern} --color", print: false
					end
				end

				alias_tool :ps, :status
			end
		end
	end
end
