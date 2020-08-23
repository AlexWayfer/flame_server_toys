# frozen_string_literal: true

require 'toys-core'

module FlameServerToys
	## Root template for `server` tool
	class Template
		include Toys::Template

		attr_reader :config_proc

		def initialize(config_proc:)
			@config_proc = config_proc
		end

		on_expand do |template|
			tool :server do
				require_relative 'template/_base'

				subtool_apply do
					## Order is important because `sh` is overriding in `CommonCode`

					include :exec, exit_on_nonzero_status: true

					include Template::Base::CommonCode
				end

				require 'gorilla_patch/inflections'
				using GorillaPatch::Inflections

				%w[start stop restart phased_restart monitor status].each do |subtool|
					require_relative "template/#{subtool}"
					expand Template.const_get(subtool.camelize, false), config_proc: template.config_proc
				end
			end

			alias_tool :s, :server
		end
	end
end
